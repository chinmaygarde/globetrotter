class CreateCheckpoints < ActiveRecord::Migration
  def self.up
    create_table :checkpoints do |t|
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :checkpoints
  end
end
