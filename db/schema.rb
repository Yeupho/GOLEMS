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

ActiveRecord::Schema.define(version: 20170418032023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.string   "color_code"
    t.string   "color_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_colors_on_deleted_at", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name"
    t.string   "country_abbrev"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_countries_on_deleted_at", using: :btree
  end

  create_table "customer_event_products", force: :cascade do |t|
    t.integer  "customer_event_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "pickup_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_customer_event_products_on_deleted_at", using: :btree
  end

  create_table "customer_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "customer_id"
    t.integer  "number_in_party"
    t.integer  "adults_painting"
    t.integer  "kids_painting"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_customer_events_on_deleted_at", using: :btree
  end

  create_table "customer_statuses", force: :cascade do |t|
    t.string   "customer_status_description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_customer_statuses_on_deleted_at", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zipcode"
    t.integer  "country_id"
    t.string   "comment"
    t.integer  "customer_status_id", default: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree
  end

  create_table "employee_events", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_employee_events_on_deleted_at", using: :btree
  end

  create_table "employee_statuses", force: :cascade do |t|
    t.string   "employee_status_desc"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_employee_statuses_on_deleted_at", using: :btree
  end

  create_table "employee_types", force: :cascade do |t|
    t.string   "employee_type_desc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_employee_types_on_deleted_at", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zipcode"
    t.integer  "country_id"
    t.text     "comment"
    t.integer  "employee_status_id", default: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_employees_on_deleted_at", using: :btree
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
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_event_types_on_deleted_at", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "event_type_id"
    t.integer  "color_id",          default: 1
    t.integer  "event_status_id",   default: 1
    t.string   "event_description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_events_on_deleted_at", using: :btree
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
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_positions_on_deleted_at", using: :btree
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "product_type_desc"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_product_types_on_deleted_at", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.decimal  "product_price"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name"
    t.string   "state_abbrev"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_states_on_deleted_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
