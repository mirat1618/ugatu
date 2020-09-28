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

ActiveRecord::Schema.define(version: 2020_09_27_090645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "title"
    t.string "abbreviation"
    t.bigint "faculty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
  end

  create_table "departments_lecturers", id: false, force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "lecturer_id", null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "disciplines_lecturers", id: false, force: :cascade do |t|
    t.bigint "discipline_id", null: false
    t.bigint "lecturer_id", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "title"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturers", force: :cascade do |t|
    t.string "fullname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturers_university_groups", id: false, force: :cascade do |t|
    t.bigint "university_group_id", null: false
    t.bigint "lecturer_id", null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer "first_question"
    t.integer "second_question"
    t.integer "third_question"
    t.integer "fourth_question"
    t.integer "fifth_question"
    t.integer "sixth_question"
    t.integer "seventh_question"
    t.bigint "lecturer_id", null: false
    t.bigint "university_group_id", null: false
    t.bigint "discipline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_questionnaires_on_discipline_id"
    t.index ["lecturer_id"], name: "index_questionnaires_on_lecturer_id"
    t.index ["university_group_id"], name: "index_questionnaires_on_university_group_id"
  end

  create_table "university_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "department_id", null: false
    t.bigint "faculty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_university_groups_on_department_id"
    t.index ["faculty_id"], name: "index_university_groups_on_faculty_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "departments", "faculties"
  add_foreign_key "questionnaires", "disciplines"
  add_foreign_key "questionnaires", "lecturers"
  add_foreign_key "questionnaires", "university_groups"
  add_foreign_key "university_groups", "departments"
  add_foreign_key "university_groups", "faculties"
end
