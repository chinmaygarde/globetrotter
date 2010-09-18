class AddAddressToCheckpoint < ActiveRecord::Migration
  def self.up
    add_column :checkpoints, :address, :text
  end

  def self.down
    remove_column :checkpoints, :address
  end
end
