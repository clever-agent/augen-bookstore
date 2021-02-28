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

ActiveRecord::Schema.define(version: 2021_02_27_111144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircraft_delivery_infos", force: :cascade do |t|
    t.string "flight_no"
    t.string "gate_of_arrival"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_cost_factors", force: :cascade do |t|
    t.decimal "base_cost"
    t.decimal "jun_to_aug"
    t.decimal "sep"
    t.decimal "other_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "service"
  end

  create_table "motorbike_delivery_infos", force: :cascade do |t|
    t.string "driver_name"
    t.string "mobile"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_infos", force: :cascade do |t|
    t.string "book_link"
    t.string "book_title"
    t.datetime "delivery_date"
    t.decimal "cost"
    t.string "delivery_type"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_name"
    t.string "customer_address"
  end

  create_table "train_delivery_infos", force: :cascade do |t|
    t.string "train_no"
    t.string "station_of_arrival"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
