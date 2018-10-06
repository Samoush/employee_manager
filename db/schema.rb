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

ActiveRecord::Schema.define(version: 2018_10_06_125353) do

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "employee_no"
    t.integer "lohn_manager_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_person"
    t.string "telephone"
    t.string "email"
    t.string "website"
    t.integer "night_addition_in_percent"
    t.integer "sunday_addition_in_percent"
    t.integer "holiday_addition_in_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "employer_id"
    t.bigint "employee_id"
    t.time "start_time"
    t.time "end_time"
    t.date "date"
    t.integer "working_hours"
    t.float "hourly_compensation"
    t.float "employee_hourly_compensation"
    t.integer "break_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["employer_id"], name: "index_orders_on_employer_id"
  end

end
