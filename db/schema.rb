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

ActiveRecord::Schema.define(version: 20140903071642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archived_students", force: true do |t|
    t.integer  "student_id"
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.integer  "immediate_contact"
    t.boolean  "is_sms_enabled",     default: true
    t.string   "photo_filename"
    t.string   "photo_content_type"
    t.binary   "photo_data"
    t.string   "status_description"
    t.boolean  "is_active",          default: true
    t.boolean  "is_deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "archived_students", ["batch_id"], name: "index_archived_students_on_batch_id", using: :btree
  add_index "archived_students", ["category_id"], name: "index_archived_students_on_category_id", using: :btree

  create_table "attendences", force: true do |t|
    t.integer  "student_id"
    t.integer  "period_table_entry_id"
    t.boolean  "forenoon",              default: false
    t.boolean  "afternoon",             default: false
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendences", ["period_table_entry_id"], name: "index_attendences_on_period_table_entry_id", using: :btree
  add_index "attendences", ["student_id"], name: "index_attendences_on_student_id", using: :btree

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

  create_table "class_designations", force: true do |t|
    t.string   "name"
    t.decimal  "cgpa"
    t.decimal  "marks"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_designations", ["course_id"], name: "index_class_designations_on_course_id", using: :btree

  create_table "class_timings", force: true do |t|
    t.integer  "batch_id"
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "is_break"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_timings", ["batch_id"], name: "index_class_timings_on_batch_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "statement"
    t.integer  "newscast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["newscast_id"], name: "index_comments_on_newscast_id", using: :btree

  create_table "countries", force: true do |t|
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

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_common",   default: false
    t.boolean  "is_holiday",  default: false
    t.boolean  "is_exam",     default: false
    t.boolean  "is_due",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_groups", force: true do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.string   "exam_type"
    t.boolean  "is_published",     default: false
    t.boolean  "result_published", default: false
    t.date     "exam_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_groups", ["batch_id"], name: "index_exam_groups_on_batch_id", using: :btree

  create_table "exam_scores", force: true do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks"
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_scores", ["exam_id"], name: "index_exam_scores_on_exam_id", using: :btree
  add_index "exam_scores", ["student_id"], name: "index_exam_scores_on_student_id", using: :btree

  create_table "exams", force: true do |t|
    t.integer  "exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "maximum_marks"
    t.integer  "minimum_marks"
    t.integer  "grading_level_id"
    t.integer  "weightage",        default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["event_id"], name: "index_exams_on_event_id", using: :btree
  add_index "exams", ["exam_group_id"], name: "index_exams_on_exam_group_id", using: :btree
  add_index "exams", ["grading_level_id"], name: "index_exams_on_grading_level_id", using: :btree
  add_index "exams", ["subject_id"], name: "index_exams_on_subject_id", using: :btree

  create_table "general_settings", force: true do |t|
    t.string   "InstitutionName"
    t.string   "InstitutionAddress"
    t.string   "InstitutionPhoneNo"
    t.string   "StudentAttendanceType"
    t.date     "Finance_start_year_date"
    t.date     "Finance_end_year_date"
    t.string   "Language"
    t.string   "TimeZone"
    t.string   "Country"
    t.string   "NetworkState"
    t.string   "IncludeGradingSystem"
    t.integer  "AddmissionNumberAutoIncreament"
    t.integer  "EmployeeNumberAutoIncreament"
    t.string   "EnableNewsCommentModeration"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grading_levels", force: true do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.integer  "min_score"
    t.string   "description"
    t.integer  "order"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grading_levels", ["batch_id"], name: "index_grading_levels_on_batch_id", using: :btree

  create_table "guardians", force: true do |t|
    t.integer  "student_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guardians", ["country_id"], name: "index_guardians_on_country_id", using: :btree
  add_index "guardians", ["student_id"], name: "index_guardians_on_student_id", using: :btree

  create_table "newscasts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "online_exam_groups", force: true do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.string   "exam_type"
    t.boolean  "is_published",     default: false
    t.boolean  "result_published", default: false
    t.string   "students_list"
    t.date     "exam_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "online_exam_groups", ["batch_id"], name: "index_online_exam_groups_on_batch_id", using: :btree

  create_table "online_exam_scores", force: true do |t|
    t.integer  "student_id"
    t.integer  "online_exam_id"
    t.decimal  "marks"
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "online_exam_scores", ["grading_level_id"], name: "index_online_exam_scores_on_grading_level_id", using: :btree
  add_index "online_exam_scores", ["online_exam_id"], name: "index_online_exam_scores_on_online_exam_id", using: :btree
  add_index "online_exam_scores", ["student_id"], name: "index_online_exam_scores_on_student_id", using: :btree

  create_table "online_exams", force: true do |t|
    t.integer  "online_exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "maximum_marks"
    t.integer  "minimum_marks"
    t.integer  "grading_level_id"
    t.integer  "weightage",            default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "online_exams", ["event_id"], name: "index_online_exams_on_event_id", using: :btree
  add_index "online_exams", ["grading_level_id"], name: "index_online_exams_on_grading_level_id", using: :btree
  add_index "online_exams", ["online_exam_group_id"], name: "index_online_exams_on_online_exam_group_id", using: :btree
  add_index "online_exams", ["subject_id"], name: "index_online_exams_on_subject_id", using: :btree

  create_table "ranking_levels", force: true do |t|
    t.string   "name"
    t.decimal  "gpa"
    t.decimal  "marks"
    t.integer  "subject_count"
    t.integer  "prioriy"
    t.boolean  "full_course"
    t.integer  "course_id"
    t.string   "subject_limit_type"
    t.string   "marks_limit_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ranking_levels", ["course_id"], name: "index_ranking_levels_on_course_id", using: :btree

  create_table "student_previous_data", force: true do |t|
    t.integer  "student_id"
    t.string   "institution"
    t.string   "year"
    t.string   "course"
    t.string   "total_mark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_previous_data", ["student_id"], name: "index_student_previous_data_on_student_id", using: :btree

  create_table "student_previous_subject_marks", force: true do |t|
    t.integer  "student_id"
    t.string   "subject"
    t.string   "mark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_previous_subject_marks", ["student_id"], name: "index_student_previous_subject_marks_on_student_id", using: :btree

  create_table "student_subjects", force: true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_subjects", ["batch_id"], name: "index_student_subjects_on_batch_id", using: :btree
  add_index "student_subjects", ["student_id"], name: "index_student_subjects_on_student_id", using: :btree
  add_index "student_subjects", ["subject_id"], name: "index_student_subjects_on_subject_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.integer  "immediate_contact"
    t.boolean  "is_sms_enabled",     default: true
    t.string   "photo_filename"
    t.string   "photo_content_type"
    t.binary   "photo_data"
    t.string   "status_description"
    t.boolean  "is_active",          default: true
    t.boolean  "is_deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["batch_id"], name: "index_students_on_batch_id", using: :btree
  add_index "students", ["category_id"], name: "index_students_on_category_id", using: :btree

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

  create_table "time_table_entries", force: true do |t|
    t.integer  "batch_id"
    t.integer  "week_day_id"
    t.integer  "class_timing_id"
    t.integer  "subject_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_table_entries", ["batch_id"], name: "index_time_table_entries_on_batch_id", using: :btree
  add_index "time_table_entries", ["class_timing_id"], name: "index_time_table_entries_on_class_timing_id", using: :btree
  add_index "time_table_entries", ["employee_id"], name: "index_time_table_entries_on_employee_id", using: :btree
  add_index "time_table_entries", ["subject_id"], name: "index_time_table_entries_on_subject_id", using: :btree
  add_index "time_table_entries", ["week_day_id"], name: "index_time_table_entries_on_week_day_id", using: :btree

  create_table "time_tables", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "role"
    t.string   "hashed_password"
    t.string   "reset_password_code"
    t.datetime "reset_password_code_until"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weekdays", force: true do |t|
    t.integer  "batch_id"
    t.string   "weekday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weekdays", ["batch_id"], name: "index_weekdays_on_batch_id", using: :btree

end
