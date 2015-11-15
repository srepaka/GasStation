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

ActiveRecord::Schema.define(version: 20151115085438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_reports", force: :cascade do |t|
    t.date     "date",                                                 null: false
    t.decimal  "grocery",      precision: 7, scale: 2,                 null: false
    t.decimal  "fuel",         precision: 7, scale: 2,                 null: false
    t.decimal  "gift_cards",   precision: 7, scale: 2, default: 0.0,   null: false
    t.decimal  "credit",       precision: 7, scale: 2,                 null: false
    t.decimal  "debit",        precision: 7, scale: 2,                 null: false
    t.decimal  "cash",         precision: 7, scale: 2,                 null: false
    t.decimal  "commission",   precision: 7, scale: 2, default: 225.0, null: false
    t.decimal  "actual_debit", precision: 7, scale: 2, default: 0.0,   null: false
    t.decimal  "cash_counted", precision: 7, scale: 2,                 null: false
    t.text     "notes"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

end
