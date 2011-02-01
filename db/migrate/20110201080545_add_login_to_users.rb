class AddLoginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :text, :null => false, :default => ""
  end

  def self.down
    remove_column :users, :login
  end
end
