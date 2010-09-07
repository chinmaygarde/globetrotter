class Checkpoint < ActiveRecord::Base
  belongs_to :user
  validates_numericality_of :latitude, :longitude
  acts_as_mappable :default_units => :kms, :lat_column_name => :latitude, :lng_column_name => :longitude
end
