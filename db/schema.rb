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

ActiveRecord::Schema.define(version: 20161012163717) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "item_id",                null: false
    t.integer  "cart_id",                null: false
    t.integer  "quantity",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "description"
    t.boolean  "enabled",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["enabled", "position"], name: "index_categories_on_enabled_and_position"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.integer  "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "amount",                     null: false
    t.string   "email",                      null: false
    t.string   "name"
    t.string   "mobile"
    t.boolean  "paid",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "description"
    t.text     "content"
    t.integer  "price"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "shelved_on"
    t.index ["category_id", "active", "shelved_on"], name: "index_products_on_category_id_and_active_and_shelved_on"
    t.index ["category_id", "active"], name: "index_products_on_category_id_and_active"
    t.index ["category_id"], name: "index_products_on_category_id"
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
