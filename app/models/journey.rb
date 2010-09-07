class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_checkpoint, :class_name => "Checkpoint", :foreign_key => "from_checkpoint"
  belongs_to :to_checkpoint, :class_name => "Checkpoint", :foreign_key => "to_checkpoint"
end
