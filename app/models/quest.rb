class Quest < ActiveRecord::Base
  belongs_to :quest_master, :class_name => "User", :foreign_key => "quest_master"
  has_many :quest_memberships, :class_name => "QuestMembership", :foreign_key => "quest_id"
  has_many :members, :through => :quest_memberships, :source => :user
  
  has_many :journey_quests, :class_name => "JourneyQuest", :foreign_key => "quest_id"
  has_many :journeys, :through => :journey_quests, :source => :journey
  
  define_index do
    indexes title, :sortable => true
    indexes description, :sortable => true
  end
  
  def distance_complete
    journeys.sum(:distance)
  end
  
  def percent_complete
    complete = (distance_complete / distance) * 100
    if complete > 100
      100
    else
      complete
    end
  end

  def update_completed_flag
    if distance_complete >= self.distance
      self.completed = true
      self.save
      self.members.each do |member|
        member.send_notification("You have completed the '#{self.title}' quest")
      end
      self.quest_master.send_notification("You have completed '#{self.title}' quest")
    end
  end
end
