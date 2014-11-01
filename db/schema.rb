# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140520032823) do

  create_table "admins", force: true do |t|
    t.string   "username",        limit: 25
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "course_modules", force: true do |t|
    t.string   "title",      limit: 100, null: false
    t.string   "code",       limit: 15,  null: false
    t.string   "lecturer",   limit: 25,  null: false
    t.integer  "level",                  null: false
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_modules", ["code"], name: "index_course_modules_on_code", unique: true, using: :btree
  add_index "course_modules", ["title"], name: "index_course_modules_on_title", using: :btree

  create_table "courses", force: true do |t|
    t.string   "title",            limit: 100, null: false
    t.string   "short_title",      limit: 15,  null: false
    t.string   "code",             limit: 15,  null: false
    t.integer  "number_of_levels",             null: false
    t.string   "category",         limit: 15,  null: false
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["code"], name: "index_courses_on_code", unique: true, using: :btree
  add_index "courses", ["short_title"], name: "index_courses_on_short_title", using: :btree

  create_table "departments", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "school",     limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["name"], name: "index_departments_on_name", using: :btree

  create_table "locations", force: true do |t|
    t.string   "address",           null: false
    t.float    "latitude",          null: false
    t.float    "longitude",         null: false
    t.integer  "locationable_id"
    t.string   "locationable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", force: true do |t|
    t.string   "name",                   limit: 50,              null: false
    t.string   "category",               limit: 50,              null: false
    t.text     "descritpion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "societies", ["email"], name: "index_societies_on_email", unique: true, using: :btree
  add_index "societies", ["name"], name: "index_societies_on_name", unique: true, using: :btree
  add_index "societies", ["reset_password_token"], name: "index_societies_on_reset_password_token", unique: true, using: :btree

  create_table "students", force: true do |t|
    t.string   "first_name",                   limit: 25,              null: false
    t.string   "last_name",                    limit: 25,              null: false
    t.string   "student_number",               limit: 15,              null: false
    t.integer  "level",                                                null: false
    t.date     "date_of_birth"
    t.string   "telephone_number",             limit: 25
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                   default: "", null: false
    t.string   "encrypted_password",                      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
  add_index "students", ["student_number"], name: "index_students_on_student_number", unique: true, using: :btree

  create_table "timetables", force: true do |t|
    t.integer  "level"
    t.integer  "term"
    t.date     "start_at"
    t.date     "end_at"
    t.string   "academic_year", limit: 20
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "university_events", force: true do |t|
    t.string   "title",            limit: 100, null: false
    t.date     "date",                         null: false
    t.time     "start_at",                     null: false
    t.time     "end_at",                       null: false
    t.string   "repeat_type",      limit: 15,  null: false
    t.integer  "repeat_frequency",             null: false
    t.string   "colour",           limit: 15,  null: false
    t.string   "privacy",          limit: 15,  null: false
    t.text     "description"
    t.string   "day",              limit: 20,  null: false
    t.string   "group",            limit: 20
    t.string   "type"
    t.integer  "timetable_id"
    t.integer  "course_module_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "room"
    t.string   "lecturer"
  end

  create_table "user_events", force: true do |t|
    t.string   "title",            limit: 100, null: false
    t.date     "date",                         null: false
    t.time     "start_at",                     null: false
    t.time     "end_at",                       null: false
    t.string   "repeat_type",      limit: 15,  null: false
    t.integer  "repeat_frequency",             null: false
    t.string   "colour",           limit: 15,  null: false
    t.string   "privacy",          limit: 15,  null: false
    t.text     "description"
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
