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

ActiveRecord::Schema.define(version: 2018_09_20_150134) do

  create_table "addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "city"
    t.string "street"
    t.string "post_code"
    t.string "phone"
    t.integer "user_id"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.float "price"
    t.integer "cart_id"
    t.boolean "device_protection"
    t.integer "order_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "delivery_type"
    t.float "delivery_cost"
    t.string "delivery_date"
    t.integer "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "address_id"
    t.integer "user_id"
    t.datetime "order_date"
    t.float "overall_price"
    t.integer "delivery_id"
    t.string "state"
  end

  create_table "product_images", force: :cascade do |t|
    t.string "picture"
    t.integer "product_id"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.float "price"
    t.string "highlights"
    t.string "description"
    t.integer "category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

end
