class AddDistanceToJourney < ActiveRecord::Migration
  def self.up
    add_column :journeys, :distance, :float
  end

  def self.down
    remove_column :journeys, :distance
  end
end
