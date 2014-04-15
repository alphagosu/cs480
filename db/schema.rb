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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140415175306) do

  create_table "collaborations", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "country"
    t.string   "state"
    t.string   "county"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stage"
    t.boolean  "n_funding"
    t.boolean  "n_study_partners"
    t.boolean  "n_space"
    t.boolean  "n_areas_of_expertise"
    t.boolean  "n_previous_work"
    t.string   "n_expertise"
    t.integer  "user_id"
    t.boolean  "complete",             default: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "collaborations", ["user_id", "created_at"], name: "index_collaborations_on_user_id_and_created_at"

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id"

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id"

  create_table "relationships", force: true do |t|
    t.integer  "collab_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["collab_id", "user_id"], name: "index_relationships_on_collab_id_and_user_id", unique: true
  add_index "relationships", ["collab_id"], name: "index_relationships_on_collab_id"
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "country"
    t.string   "state"
    t.string   "county"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "is_researcher"
    t.boolean  "is_teacher"
    t.boolean  "is_student"
    t.boolean  "is_comm_member"
    t.string   "study_location"
    t.string   "main_interests"
    t.integer  "experience"
    t.integer  "travel_distance"
    t.boolean  "i_obesity",             default: false
    t.boolean  "i_diabetes",            default: false
    t.boolean  "i_heart",               default: false
    t.boolean  "i_injury",              default: false
    t.boolean  "i_violence_prevention", default: false
    t.boolean  "i_falls",               default: false
    t.string   "s_animal"
    t.string   "s_children"
    t.string   "s_adults"
    t.string   "s_environment"
    t.string   "s_cells"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "notify_new_message",    default: true
    t.boolean  "notify_new_collab",     default: true
    t.integer  "notify_collab_percent", default: 70
    t.boolean  "admin",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
