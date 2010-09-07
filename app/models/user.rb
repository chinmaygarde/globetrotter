class User < ActiveRecord::Base
  has_many :checkpoints
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :journeys
  has_many :quests, :class_name => "Quest", :foreign_key => "quest_master"
  
  acts_as_authentic
end
