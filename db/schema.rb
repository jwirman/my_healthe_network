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

ActiveRecord::Schema.define(version: 20140307153229) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", force: true do |t|
    t.integer  "user_id"
    t.integer  "med_id"
    t.datetime "taken_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charts", ["med_id"], name: "index_charts_on_med_id", using: :btree
  add_index "charts", ["user_id"], name: "index_charts_on_user_id", using: :btree

  create_table "meds", force: true do |t|
    t.string   "generic_name"
    t.string   "brand_name"
    t.string   "strength"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scans", force: true do |t|
    t.integer  "user_id"
    t.integer  "med_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scans", ["med_id"], name: "index_scans_on_med_id", using: :btree
  add_index "scans", ["user_id"], name: "index_scans_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin",               default: false, null: false
    t.string   "dob"
    t.string   "cell_phone"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_meds", force: true do |t|
    t.integer  "user_id"
    t.integer  "med_id"
    t.string   "type"
    t.string   "freq"
    t.string   "freq_unit"
    t.integer  "num_per_dose"
    t.date     "start"
    t.time     "first_dose"
    t.time     "second_dose"
    t.time     "third_dose"
    t.time     "fourth_dose"
    t.time     "fifth_dose"
    t.time     "sixth_dose"
    t.integer  "window",       default: 5, null: false
    t.integer  "num_doses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
