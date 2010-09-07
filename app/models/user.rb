class User < ActiveRecord::Base
  has_many :checkpoints
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :journeys
  has_many :quests, :class_name => "Quest", :foreign_key => "quest_master"
  
  after_create :add_life_quest
  
  acts_as_authentic
  
  private
  def add_life_quest
    quest = quests.build(:title => DEFAULT_QUEST["title"], :description => DEFAULT_QUEST["description"], :distance => DEFAULT_QUEST["distance"])
    quest.save
  end
end
