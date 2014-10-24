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

ActiveRecord::Schema.define(version: 20131023141903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "client_id"
    t.date     "occured_on"
    t.time     "start"
    t.time     "end"
    t.boolean  "copay_received"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "copay"
  end

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "effective_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "insurance_providers", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "member_id"
    t.integer  "copay"
    t.date     "effective_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
