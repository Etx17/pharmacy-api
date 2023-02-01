# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_01_134347) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "pharmacy_id", null: false
    t.bigint "laboratory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_orders_on_laboratory_id"
    t.index ["pharmacy_id"], name: "index_orders_on_pharmacy_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "laboratory_id", null: false
    t.integer "lab_selling_price"
    t.integer "cost_of_production"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_products_on_laboratory_id"
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "sale_products", force: :cascade do |t|
    t.bigint "pharmacy_id", null: false
    t.integer "stock_count"
    t.integer "selling_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["pharmacy_id"], name: "index_sale_products_on_pharmacy_id"
    t.index ["product_id", "pharmacy_id"], name: "index_sale_products_on_product_id_and_pharmacy_id", unique: true
    t.index ["product_id"], name: "index_sale_products_on_product_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "sale_product_id", null: false
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_product_id"], name: "index_sales_on_sale_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pharmacy_id"
    t.bigint "laboratory_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["laboratory_id"], name: "index_users_on_laboratory_id"
    t.index ["pharmacy_id"], name: "index_users_on_pharmacy_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "laboratories"
  add_foreign_key "orders", "pharmacies"
  add_foreign_key "products", "laboratories"
  add_foreign_key "sale_products", "pharmacies"
  add_foreign_key "sales", "sale_products"
  add_foreign_key "users", "laboratories"
  add_foreign_key "users", "pharmacies"
end
