# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120602225329) do

  create_table "annotations", :force => true do |t|
    t.integer  "facebook_id",   :limit => 8
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "facebook_name"
  end

  create_table "comments", :force => true do |t|
    t.string   "facebook_id"
    t.integer  "from",                :limit => 8
    t.integer  "to",                  :limit => 8
    t.integer  "likes"
    t.text     "message"
    t.datetime "facebook_created_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "message_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "messages", :force => true do |t|
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.text     "content"
    t.string   "facebook_id"
    t.integer  "from",                  :limit => 8
    t.integer  "to",                    :limit => 8
    t.string   "post_type"
    t.integer  "tag_count",                          :default => 0
    t.integer  "like_count",                         :default => 0
    t.integer  "comment_count",                      :default => 0
    t.datetime "facebook_created_time"
    t.datetime "facebook_updated_time"
    t.boolean  "recipient_is_tagged"
    t.string   "application_name"
    t.boolean  "has_link"
    t.boolean  "has_video"
    t.boolean  "has_with_tag"
    t.boolean  "has_place"
  end

  create_table "response_logs", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "facebook_id", :limit => 8
    t.string   "gender"
    t.string   "locale"
    t.date     "birthday"
    t.integer  "friend_of",   :limit => 8
  end

end
