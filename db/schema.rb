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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 0) do
=======
ActiveRecord::Schema.define(version: 20140814052800) do
>>>>>>> bb02eeda859dd434e6da22357404ffc2d94ad70e

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
=======
  create_table "batches", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",  default: true
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batches", ["course_id"], name: "index_batches_on_course_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.string   "code"
    t.string   "section_name"
    t.string   "grading_type"
    t.boolean  "is_deleted",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elective_groups", force: true do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elective_groups", ["batch_id"], name: "index_elective_groups_on_batch_id", using: :btree

  create_table "general_settings", force: true do |t|
    t.string   "institution_name"
    t.string   "institution_address"
    t.string   "institution_phone_no"
    t.string   "student_attendance_type"
    t.string   "language"
    t.string   "time_zone"
    t.string   "country"
    t.string   "network_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grading_levels", force: true do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.integer  "min_score"
    t.integer  "order"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grading_levels", ["batch_id"], name: "index_grading_levels_on_batch_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "batch_id"
    t.boolean  "no_exams",           default: false
    t.integer  "max_weekly_classes"
    t.integer  "elective_group_id"
    t.boolean  "is_deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["batch_id"], name: "index_subjects_on_batch_id", using: :btree
  add_index "subjects", ["elective_group_id"], name: "index_subjects_on_elective_group_id", using: :btree

>>>>>>> bb02eeda859dd434e6da22357404ffc2d94ad70e
end
