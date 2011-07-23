class DeleteDevise < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
    puts "No way, sorry."
  end
end
