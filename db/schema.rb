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

ActiveRecord::Schema[7.1].define(version: 2024_06_12_235048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchases", force: :cascade do |t|
    t.string "purchaser_name"
    t.string "item_description"
    t.decimal "item_price"
    t.integer "purchase_count"
    t.string "merchant_address"
    t.string "merchant_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", id: :serial, force: :cascade do |t|
    t.string "purchaser_name", limit: 100
    t.text "item_description"
    t.decimal "item_price", precision: 10, scale: 2
    t.integer "purchase_count"
    t.string "merchant_address", limit: 255
    t.string "merchant_name", limit: 100
    t.timestamptz "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamptz "updated_at", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "tab_files", force: :cascade do |t|
    t.string "purchaser_name"
    t.string "item_description"
    t.decimal "item_price"
    t.integer "purchase_count"
    t.string "merchant_address"
    t.string "merchant_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
