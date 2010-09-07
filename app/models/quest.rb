class Quest < ActiveRecord::Base
  belongs_to :quest_master, :class_name => "User", :foreign_key => "quest_master"
end
