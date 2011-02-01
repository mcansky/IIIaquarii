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

ActiveRecord::Schema.define(:version => 20110201131157) do

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
    t.integer  "aq_brach_id",   :default => 0
    t.integer  "aq_repository", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aq_repositories", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "kind",       :default => "git"
    t.text     "desc"
    t.integer  "parent_id"
    t.integer  "visibility", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "login",                               :default => "", :null => false
    t.string   "cached_slug"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
