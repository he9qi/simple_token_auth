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

ActiveRecord::Schema.define(version: 20141203034209) do

  create_table "api_keys", force: true do |t|
    t.integer  "token_authenticatable_id",   null: false
    t.string   "token_authenticatable_type", null: false
    t.string   "access_token",               null: false
    t.datetime "expired_at"
    t.datetime "created_at"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
