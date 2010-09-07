class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_checkpoint, :class_name => "Checkpoint", :foreign_key => "from_checkpoint"
  belongs_to :to_checkpoint, :class_name => "Checkpoint", :foreign_key => "to_checkpoint"
  
  after_create :calculate_distance
  
  private
  def calculate_distance
    self.distance = from_checkpoint.distance_to(to_checkpoint) if self.distance.nil?
    self.save
  end
end
