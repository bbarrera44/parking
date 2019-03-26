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

ActiveRecord::Schema.define(version: 2019_03_20_221631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.integer "vehicle_id"
    t.integer "rate_id"
    t.integer "parking_id"
    t.datetime "entry_time"
    t.datetime "exit_time"
    t.integer "total_time"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parkings", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.date "date_begin"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.string "color"
    t.string "brand"
    t.integer "parking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
