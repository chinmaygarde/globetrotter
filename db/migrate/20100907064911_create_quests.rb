class CreateQuests < ActiveRecord::Migration
  def self.up
    create_table :quests do |t|
      t.string :title
      t.text :description
      t.integer :quest_master
      t.float :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :quests
  end
end
