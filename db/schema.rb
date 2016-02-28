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

ActiveRecord::Schema.define(version: 20160227142503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "invoices", primary_key: "uuid", force: :cascade do |t|
    t.string   "custom_id"
    t.string   "name"
    t.string   "description"
    t.string   "validation_hash"
    t.jsonb    "callback_params"
    t.integer  "status",          default: 0
    t.string   "currency",        default: "USD"
    t.string   "btc_address"
    t.string   "bitcoin_uri"
    t.integer  "price_cents",     default: 0,     null: false
    t.datetime "valid_till"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
