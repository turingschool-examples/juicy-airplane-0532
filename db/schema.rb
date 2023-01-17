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

ActiveRecord::Schema.define(version: 2023_01_17_161350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_tickets", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "tickets_id"
    t.index ["employee_id"], name: "index_employee_tickets_on_employee_id"
    t.index ["tickets_id"], name: "index_employee_tickets_on_tickets_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "subject"
    t.integer "age"
    t.boolean "open"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_tickets_on_employee_id"
  end

  add_foreign_key "employee_tickets", "employees"
  add_foreign_key "employee_tickets", "tickets", column: "tickets_id"
  add_foreign_key "employees", "departments"
  add_foreign_key "tickets", "employees"
end
