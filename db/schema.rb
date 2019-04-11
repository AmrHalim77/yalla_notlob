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

ActiveRecord::Schema.define(version: 2019_04_10_185629) do

  create_table "items", force: :cascade do |t|
    t.integer "item_id"
    t.string "item_name"
    t.integer "amount"
    t.integer "price"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "user_id"
    t.index ["order_id"], name: "index_items_on_order_id", unique: true
    t.index ["user_id"], name: "index_items_on_user_id", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_status"
    t.string "order_type"
    t.string "restaurant"
    t.string "menu_image"
    t.string "joined_users"
    t.string "invited_users"
    t.string "order_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "friends"
    t.string "groups"
    t.string "orders"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
