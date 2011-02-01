class CreateAqRepositories < ActiveRecord::Migration
  def self.up
    create_table :aq_repositories do |t|
      t.string :name
      t.string :path
      t.string :kind, :default => "git"
      t.text   :desc

      # Used for "fork" repos
      t.integer :parent_id

      # For private repos
      # 0 = public
      # 1 = private
      t.integer :visibility, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :aq_repositories
  end
end
