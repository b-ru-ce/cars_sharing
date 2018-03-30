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

ActiveRecord::Schema.define(version: 20180330072844) do

  create_table "cars", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.integer  "partner_id", limit: 4
    t.string   "reg_number", limit: 255
    t.integer  "status",     limit: 4,   default: 0, null: false
    t.integer  "fuel_max",   limit: 4
    t.integer  "fuel",       limit: 4
    t.integer  "mileage",    limit: 4
    t.integer  "foreign_id", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "cars", ["foreign_id", "partner_id"], name: "index_cars_on_foreign_id_and_partner_id", unique: true, using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
