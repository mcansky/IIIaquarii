class AddCachedSlugToAqRepositories < ActiveRecord::Migration
  def self.up
    add_column :aq_repositories, :cached_slug, :string
  end

  def self.down
    remove_column :aq_repositories, :cached_slug
  end
end
