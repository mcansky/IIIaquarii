# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110724113801) do

  create_table "aq_branches", :force => true do |t|
    t.string   "name"
    t.integer  "aq_repository_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aq_commits", :force => true do |t|
    t.string   "sha"
    t.text     "log"
    t.integer  "aq_branch_id"
    t.integer  "author_id"
    t.string   "author_name"
    t.datetime "committed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aq_repository_id"
  end

  create_table "aq_commits_aq_files", :id => false, :force => true do |t|
    t.integer  "aq_commit_id"
    t.integer  "aq_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aq_files", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "aq_branch_id",     :default => 0
    t.integer  "aq_repository_id", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aq_repositories", :force => true do |t|
    t.string   "name",        :limit => 25
    t.string   "path"
    t.string   "kind",                      :default => "git"
    t.string   "desc"
    t.integer  "parent_id"
    t.integer  "visibility",                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

  create_table "rights", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ssh_key_id"
    t.integer  "aq_repository_id"
    t.string   "right"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "roles", :force => true do |t|
    t.string  "name",    :default => "user"
    t.integer "user_id"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "ssh_keys", :force => true do |t|
    t.string   "name",       :default => "default"
    t.text     "key"
    t.string   "login"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                               :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.string   "single_access_token"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

end
