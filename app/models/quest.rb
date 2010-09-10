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
    distance_complete / distance
  end
  
end
