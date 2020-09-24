# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_080121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrangements", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "task_id"
    t.index ["employee_id", "task_id"], name: "by_employee_task"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_employees_on_id", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.date "execution_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["execution_date"], name: "index_tasks_on_execution_date"
    t.index ["id"], name: "index_tasks_on_id", unique: true
  end

end
