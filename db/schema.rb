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

ActiveRecord::Schema.define(version: 20150708065424) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "car_model"
    t.string   "car_reg_number"
    t.string   "service_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "car_model"
    t.string   "car_reg_number"
    t.string   "service_type"
    t.time     "time"
    t.date     "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reservations", ["car_reg_number"], name: "index_reservations_on_car_reg_number", unique: true

  create_table "workshops", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "contact_num"
    t.string   "com_reg_num"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "workshops", ["email"], name: "index_workshops_on_email", unique: true

end
