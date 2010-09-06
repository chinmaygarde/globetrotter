class Checkpoint < ActiveRecord::Base
  belongs_to :user
  validates_numericality_of :latitude, :longitude
end
