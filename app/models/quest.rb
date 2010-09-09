class Quest < ActiveRecord::Base
  belongs_to :quest_master, :class_name => "User", :foreign_key => "quest_master"
  define_index do
    indexes title, :sortable => true
    indexes description, :sortable => true
  end
end
