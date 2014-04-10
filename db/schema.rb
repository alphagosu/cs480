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

ActiveRecord::Schema.define(version: 20140409205446) do

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
  end

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
    t.string   "study"
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
