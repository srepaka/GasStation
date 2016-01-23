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

ActiveRecord::Schema.define(version: 20151119071829) do

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

  create_table "entry_categories", force: :cascade do |t|
    t.string   "category",      null: false
    t.integer  "entry_type_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "entry_categories", ["entry_type_id"], name: "index_entry_categories_on_entry_type_id", using: :btree

  create_table "entry_types", force: :cascade do |t|
    t.string   "entry_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payout_categories", force: :cascade do |t|
    t.string   "pcategory",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payouts", force: :cascade do |t|
    t.text     "description",                                null: false
    t.decimal  "amount",             precision: 5, scale: 2, null: false
    t.integer  "daily_report_id",                            null: false
    t.integer  "payout_category_id",                         null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "payouts", ["daily_report_id"], name: "index_payouts_on_daily_report_id", using: :btree
  add_index "payouts", ["payout_category_id"], name: "index_payouts_on_payout_category_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.date     "accounting_date",                                            null: false
    t.date     "transaction_date",                                           null: false
    t.string   "description",                                                null: false
    t.integer  "entry_type_id",                                              null: false
    t.integer  "entry_category_id",                                          null: false
    t.integer  "daily_report_id"
    t.decimal  "amount",            precision: 10, scale: 2,                 null: false
    t.boolean  "flagged",                                    default: false, null: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "transactions", ["daily_report_id"], name: "index_transactions_on_daily_report_id", using: :btree
  add_index "transactions", ["entry_category_id"], name: "index_transactions_on_entry_category_id", using: :btree
  add_index "transactions", ["entry_type_id"], name: "index_transactions_on_entry_type_id", using: :btree

  add_foreign_key "entry_categories", "entry_types"
  add_foreign_key "payouts", "daily_reports"
  add_foreign_key "payouts", "payout_categories"
  add_foreign_key "transactions", "daily_reports"
  add_foreign_key "transactions", "entry_categories"
  add_foreign_key "transactions", "entry_types"
end
