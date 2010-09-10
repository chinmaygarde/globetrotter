class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_checkpoint, :class_name => "Checkpoint", :foreign_key => "from_checkpoint"
  belongs_to :to_checkpoint, :class_name => "Checkpoint", :foreign_key => "to_checkpoint"
  
  has_many :journey_quests, :class_name => "JourneyQuest", :foreign_key => "journey_id"
  has_many :quests, :through => :journey_quests, :source => :quest

  after_create :calculate_distance
  
  validates_presence_of :from_checkpoint, :to_checkpoint
  
  private
  def calculate_distance
    self.distance = from_checkpoint.distance_to(to_checkpoint) if self.distance.nil?
    self.save
  end
end
