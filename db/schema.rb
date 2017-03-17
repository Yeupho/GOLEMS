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

ActiveRecord::Schema.define(version: 20170316060924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.string   "color_code"
    t.string   "color_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name"
    t.string   "country_abbrev"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "customer_event_products", force: :cascade do |t|
    t.integer  "customer_event_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "pickup_status_id"
    t.boolean  "archive",           default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "customer_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "customer_id"
    t.integer  "number_in_party"
    t.integer  "adults_painting"
    t.integer  "kids_painting"
    t.boolean  "deposit"
    t.boolean  "archive",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "customer_statuses", force: :cascade do |t|
    t.string   "customer_status_description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zipcode"
    t.integer  "country_id"
    t.string   "comment"
    t.integer  "customer_status_id"
    t.boolean  "archive",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "employee_events", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "event_id"
    t.boolean  "archive",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "employee_statuses", force: :cascade do |t|
    t.string   "employee_status_desc"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "employee_types", force: :cascade do |t|
    t.string   "employee_type_desc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zipcode"
    t.integer  "country_id"
    t.text     "comment"
    t.integer  "employee_status_id"
    t.boolean  "archive",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "event_statuses", force: :cascade do |t|
    t.string   "event_status_desc"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "event_type_desc"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "event_type_id"
    t.integer  "color_id"
    t.integer  "event_status_id"
    t.string   "event_description"
    t.boolean  "archive",           default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "pickup_statuses", force: :cascade do |t|
    t.string   "pickup_status_desc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "employee_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "product_type_desc"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.decimal  "product_price"
    t.integer  "product_type_id"
    t.boolean  "archive",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name"
    t.string   "state_abbrev"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
