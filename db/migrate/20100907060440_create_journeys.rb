class CreateJourneys < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.integer :user_id
      t.integer :from_checkpoint
      t.integer :to_checkpoint

      t.timestamps
    end
  end

  def self.down
    drop_table :journeys
  end
end
