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

ActiveRecord::Schema.define(version: 20161117065919) do

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "address",    limit: 65535
    t.string   "cardno",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "price",                  precision: 12, scale: 3
    t.boolean  "active"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item_id",     limit: 4
    t.integer  "order_id",    limit: 4
    t.decimal  "unit_price",            precision: 12, scale: 3
    t.integer  "quantity",    limit: 4
    t.decimal  "total_price",           precision: 12, scale: 3
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_promotions", force: :cascade do |t|
    t.integer  "promotion_id", limit: 4
    t.integer  "order_id",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "order_promotions", ["order_id"], name: "index_order_promotions_on_order_id", using: :btree
  add_index "order_promotions", ["promotion_id"], name: "index_order_promotions_on_promotion_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                  precision: 12, scale: 3
    t.decimal  "reduction",                 precision: 12, scale: 3
    t.decimal  "total",                     precision: 12, scale: 3
    t.integer  "order_status_id", limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "code",           limit: 255
    t.string   "reduction",      limit: 255
    t.string   "reduction_type", limit: 255
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_conjunction"
  end

  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_promotions", "orders"
  add_foreign_key "order_promotions", "promotions"
  add_foreign_key "orders", "order_statuses"
end
