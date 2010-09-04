class User < ActiveRecord::Base
  has_many :checkpoints
  acts_as_authentic
end
