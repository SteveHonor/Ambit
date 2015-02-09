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

ActiveRecord::Schema.define(version: 20150208164637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "laws", force: :cascade do |t|
    t.string "number"
    t.string "article"
    t.string "description"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "owner_name"
    t.string "owner_identifier"
    t.string "owner_zip_code"
    t.string "owner_address"
    t.string "owner_address_number"
    t.string "owner_address_complement"
    t.string "owner_district"
    t.string "owner_city"
    t.string "owner_state"
    t.string "owner_ddd_mobile"
    t.string "owner_mobile"
    t.string "owner_ddd_phone"
    t.string "owner_phone"
    t.string "property_zone"
    t.string "property_zip_code"
    t.string "property_address"
    t.string "property_address_number"
    t.string "property_address_complement"
    t.string "property_district"
    t.string "property_city"
    t.string "property_state"
    t.string "property_meter"
    t.string "property_block"
    t.string "property_allotment"
    t.string "observation"
    t.string "state"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "name"
    t.boolean  "status",                 default: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
