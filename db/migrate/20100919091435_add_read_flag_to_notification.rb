class AddReadFlagToNotification < ActiveRecord::Migration
  def self.up
    add_column :notifications, :read, :boolean, :default => false
  end

  def self.down
    remove_column :notifications, :read
  end
end
