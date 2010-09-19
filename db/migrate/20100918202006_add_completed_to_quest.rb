class AddCompletedToQuest < ActiveRecord::Migration
  def self.up
    add_column :quests, :completed, :boolean, :default => false
  end

  def self.down
    remove_column :quests, :completed
  end
end
