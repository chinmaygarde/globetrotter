class User < ActiveRecord::Base
  has_many :checkpoints
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :journeys
  has_many :quests, :class_name => "Quest", :foreign_key => "quest_master"
  has_many :notifications
  
  has_many :quest_memberships, :class_name => "QuestMembership", :foreign_key => "user_id"
  has_many :quests_as_member, :through => :quest_memberships, :source => :quest
  
  after_create :add_life_quest
  
  acts_as_authentic
  
  define_index do
    indexes username, :sortable => true
    indexes email, :sortable => true
  end
  
  def unread_notifications
    self.notifications.where(:read => false)
  end
  
  #TODO: Replace with more robust solution
  def send_notification(message)
    self.notifications.create(:message => message)
  end
  
  private
  def add_life_quest
    quest = quests.build(:title => DEFAULT_QUEST["title"], :description => DEFAULT_QUEST["description"], :distance => DEFAULT_QUEST["distance"])
    quest.save
  end
end
