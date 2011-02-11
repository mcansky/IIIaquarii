class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :default => "user"
      t.integer :user_id
    end
  end

  def self.down
    drop_table :roles
  end
end
