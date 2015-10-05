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

ActiveRecord::Schema.define(version: 20151003230048) do

  create_table "appointments", force: :cascade do |t|
    t.date     "visit_date"
    t.string   "pet_name"
    t.string   "reason_of_visit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "reminder_date"
    t.string   "customer_email"
    t.integer  "user_id"
  end

  create_table "pet_records", force: :cascade do |t|
    t.string   "pet_name"
    t.string   "type_of_pet"
    t.string   "breed"
    t.string   "age"
    t.string   "weight"
    t.string   "date_0f_last_visit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "appointment_id"
  end

  add_index "pet_records", ["appointment_id"], name: "index_pet_records_on_appointment_id"
  add_index "pet_records", ["user_id"], name: "index_pet_records_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "confirm_password"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "last_graduated_from"
    t.string   "total_practice"
    t.string   "position"
  end

end
