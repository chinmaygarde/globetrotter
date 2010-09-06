class User < ActiveRecord::Base
  has_many :checkpoints
  has_many :friendships
  has_many :friends, :through => :friendships
  acts_as_authentic
end
