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

ActiveRecord::Schema.define(version: 20141010142214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apply_leaves", force: true do |t|
    t.integer  "employee_id"
    t.integer  "employee_leave_types_id"
    t.boolean  "is_half_day"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "reason"
    t.boolean  "approved",                default: false
    t.boolean  "viewed_by_manager",       default: false
    t.string   "manager_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apply_leaves", ["employee_id"], name: "index_apply_leaves_on_employee_id", using: :btree
  add_index "apply_leaves", ["employee_leave_types_id"], name: "index_apply_leaves_on_employee_leave_types_id", using: :btree

  create_table "archived_employees", force: true do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail"
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "nationality_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.string   "photo_filename"
    t.string   "photo_content_type"
    t.binary   "photo_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "former_id"
  end

  add_index "archived_employees", ["country_id"], name: "index_archived_employees_on_country_id", using: :btree
  add_index "archived_employees", ["employee_department_id"], name: "index_archived_employees_on_employee_department_id", using: :btree
  add_index "archived_employees", ["employee_grade_id"], name: "index_archived_employees_on_employee_grade_id", using: :btree
  add_index "archived_employees", ["employee_position_id"], name: "index_archived_employees_on_employee_position_id", using: :btree

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

  create_table "assets", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "amount"
    t.boolean  "is_inactive", default: false
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendences", force: true do |t|
    t.integer  "student_id"
    t.integer  "time_table_entry_id"
    t.boolean  "forenoon",            default: false
    t.boolean  "afternoon",           default: false
    t.string   "reason"
    t.date     "month_date"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendences", ["batch_id"], name: "index_attendences_on_batch_id", using: :btree
  add_index "attendences", ["student_id"], name: "index_attendences_on_student_id", using: :btree
  add_index "attendences", ["time_table_entry_id"], name: "index_attendences_on_time_table_entry_id", using: :btree

  create_table "bank_fields", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_events", force: true do |t|
    t.integer  "batch_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batch_events", ["batch_id"], name: "index_batch_events_on_batch_id", using: :btree
  add_index "batch_events", ["event_id"], name: "index_batch_events_on_event_id", using: :btree

  create_table "batch_fee_collection_discounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_fee_discounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_groups", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batch_groups", ["course_id"], name: "index_batch_groups_on_course_id", using: :btree

  create_table "batches", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.string   "employee_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",   default: true
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batches", ["course_id"], name: "index_batches_on_course_id", using: :btree

  create_table "batches_online_exams", force: true do |t|
    t.integer  "online_exam_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batches_online_exams", ["batch_id"], name: "index_batches_online_exams_on_batch_id", using: :btree
  add_index "batches_online_exams", ["online_exam_id"], name: "index_batches_online_exams_on_online_exam_id", using: :btree

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

  create_table "employee_attendances", force: true do |t|
    t.date     "attendance_date"
    t.integer  "employee_id"
    t.integer  "employee_leave_type_id"
    t.string   "reason"
    t.boolean  "is_half_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_attendances", ["employee_id"], name: "index_employee_attendances_on_employee_id", using: :btree
  add_index "employee_attendances", ["employee_leave_type_id"], name: "index_employee_attendances_on_employee_leave_type_id", using: :btree

  create_table "employee_bank_details", force: true do |t|
    t.integer  "employee_id"
    t.integer  "bank_field_id"
    t.string   "bank_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_bank_details", ["bank_field_id"], name: "index_employee_bank_details_on_bank_field_id", using: :btree
  add_index "employee_bank_details", ["employee_id"], name: "index_employee_bank_details_on_employee_id", using: :btree

  create_table "employee_categories", force: true do |t|
    t.string   "name"
    t.string   "prefix"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_department_events", force: true do |t|
    t.integer  "event_id"
    t.integer  "employee_department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_department_events", ["employee_department_id"], name: "index_employee_department_events_on_employee_department_id", using: :btree
  add_index "employee_department_events", ["event_id"], name: "index_employee_department_events_on_event_id", using: :btree

  create_table "employee_departments", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_grades", force: true do |t|
    t.string   "name"
    t.integer  "priority"
    t.boolean  "status"
    t.integer  "max_hours_day"
    t.integer  "max_hours_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_leave_types", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.string   "max_leave_count"
    t.boolean  "enable_carry_forward"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_leaves", force: true do |t|
    t.integer  "employee_id"
    t.integer  "employee_leave_type_id"
    t.decimal  "leave_count"
    t.decimal  "leave_taken"
    t.date     "reset_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_leaves", ["employee_id"], name: "index_employee_leaves_on_employee_id", using: :btree
  add_index "employee_leaves", ["employee_leave_type_id"], name: "index_employee_leaves_on_employee_leave_type_id", using: :btree

  create_table "employee_positions", force: true do |t|
    t.string   "name"
    t.integer  "employee_category_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_positions", ["employee_category_id"], name: "index_employee_positions_on_employee_category_id", using: :btree

  create_table "employee_salary_structures", force: true do |t|
    t.integer  "employee_id"
    t.integer  "payroll_category_id"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_salary_structures", ["employee_id"], name: "index_employee_salary_structures_on_employee_id", using: :btree
  add_index "employee_salary_structures", ["payroll_category_id"], name: "index_employee_salary_structures_on_payroll_category_id", using: :btree

  create_table "employee_subjects", force: true do |t|
    t.integer  "employee_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_subjects", ["employee_id"], name: "index_employee_subjects_on_employee_id", using: :btree
  add_index "employee_subjects", ["subject_id"], name: "index_employee_subjects_on_subject_id", using: :btree

  create_table "employees", force: true do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail"
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "country_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.string   "photo_filename"
    t.string   "photo_content_type"
    t.binary   "photo_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["country_id"], name: "index_employees_on_country_id", using: :btree
  add_index "employees", ["employee_category_id"], name: "index_employees_on_employee_category_id", using: :btree
  add_index "employees", ["employee_department_id"], name: "index_employees_on_employee_department_id", using: :btree
  add_index "employees", ["employee_grade_id"], name: "index_employees_on_employee_grade_id", using: :btree
  add_index "employees", ["employee_position_id"], name: "index_employees_on_employee_position_id", using: :btree

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
  add_index "exam_scores", ["grading_level_id"], name: "index_exam_scores_on_grading_level_id", using: :btree
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

  create_table "fee_collection_discounts", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "receiver_id"
    t.integer  "finance_fee_collection_id"
    t.decimal  "discount"
    t.boolean  "is_amount",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fee_collection_discounts", ["finance_fee_collection_id"], name: "index_fee_collection_discounts_on_finance_fee_collection_id", using: :btree
  add_index "fee_collection_discounts", ["receiver_id"], name: "index_fee_collection_discounts_on_receiver_id", using: :btree

  create_table "fee_collection_particulars", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount"
    t.integer  "finance_fee_collection_id"
    t.integer  "category_id"
    t.string   "admission_no"
    t.integer  "student_id"
    t.boolean  "is_deleted",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fee_collection_particulars", ["category_id"], name: "index_fee_collection_particulars_on_category_id", using: :btree
  add_index "fee_collection_particulars", ["finance_fee_collection_id"], name: "index_fee_collection_particulars_on_finance_fee_collection_id", using: :btree
  add_index "fee_collection_particulars", ["student_id"], name: "index_fee_collection_particulars_on_student_id", using: :btree

  create_table "fee_discounts", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "receiver_id"
    t.integer  "finance_fee_category_id"
    t.decimal  "discount"
    t.boolean  "is_amount",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fee_discounts", ["finance_fee_category_id"], name: "index_fee_discounts_on_finance_fee_category_id", using: :btree
  add_index "fee_discounts", ["receiver_id"], name: "index_fee_discounts_on_receiver_id", using: :btree

  create_table "finance_donations", force: true do |t|
    t.string   "donor"
    t.string   "description"
    t.decimal  "amount"
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_donations", ["transaction_id"], name: "index_finance_donations_on_transaction_id", using: :btree

  create_table "finance_fee_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "batch_id"
    t.integer  "fee_collection_id"
    t.boolean  "is_deleted",        default: false
    t.boolean  "is_master",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_fee_categories", ["batch_id"], name: "index_finance_fee_categories_on_batch_id", using: :btree
  add_index "finance_fee_categories", ["fee_collection_id"], name: "index_finance_fee_categories_on_fee_collection_id", using: :btree

  create_table "finance_fee_collections", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "due_date"
    t.integer  "fee_category_id"
    t.integer  "batch_id"
    t.boolean  "is_deleted",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_fee_collections", ["batch_id"], name: "index_finance_fee_collections_on_batch_id", using: :btree
  add_index "finance_fee_collections", ["fee_category_id"], name: "index_finance_fee_collections_on_fee_category_id", using: :btree

  create_table "finance_fee_particulars", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount"
    t.integer  "finance_fee_category_id"
    t.integer  "category_id"
    t.string   "admission_no"
    t.integer  "student_id"
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_fee_particulars", ["category_id"], name: "index_finance_fee_particulars_on_category_id", using: :btree
  add_index "finance_fee_particulars", ["finance_fee_category_id"], name: "index_finance_fee_particulars_on_finance_fee_category_id", using: :btree
  add_index "finance_fee_particulars", ["student_id"], name: "index_finance_fee_particulars_on_student_id", using: :btree

  create_table "finance_fee_structure_elements", force: true do |t|
    t.decimal  "amount"
    t.string   "label"
    t.integer  "batch_id"
    t.integer  "category_id"
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.integer  "fee_collection_id"
    t.boolean  "is_deleted",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_fee_structure_elements", ["batch_id"], name: "index_finance_fee_structure_elements_on_batch_id", using: :btree
  add_index "finance_fee_structure_elements", ["category_id"], name: "index_finance_fee_structure_elements_on_category_id", using: :btree
  add_index "finance_fee_structure_elements", ["fee_collection_id"], name: "index_finance_fee_structure_elements_on_fee_collection_id", using: :btree
  add_index "finance_fee_structure_elements", ["guardian_id"], name: "index_finance_fee_structure_elements_on_guardian_id", using: :btree
  add_index "finance_fee_structure_elements", ["student_id"], name: "index_finance_fee_structure_elements_on_student_id", using: :btree

  create_table "finance_fees", force: true do |t|
    t.integer  "fee_collection_id"
    t.string   "transaction_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_fees", ["fee_collection_id"], name: "index_finance_fees_on_fee_collection_id", using: :btree
  add_index "finance_fees", ["student_id"], name: "index_finance_fees_on_student_id", using: :btree

  create_table "finance_transaction_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_income"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_transaction_triggers", force: true do |t|
    t.integer  "finance_fee_category_id"
    t.decimal  "percentage"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_transaction_triggers", ["finance_fee_category_id"], name: "index_finance_transaction_triggers_on_finance_fee_category_id", using: :btree

  create_table "finance_transactions", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "amount"
    t.boolean  "fine_included",   default: false
    t.integer  "category_id"
    t.integer  "student_id"
    t.integer  "finance_fees_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finance_transactions", ["category_id"], name: "index_finance_transactions_on_category_id", using: :btree
  add_index "finance_transactions", ["finance_fees_id"], name: "index_finance_transactions_on_finance_fees_id", using: :btree
  add_index "finance_transactions", ["student_id"], name: "index_finance_transactions_on_student_id", using: :btree

  create_table "general_settings", force: true do |t|
    t.string   "school_or_college_name"
    t.string   "school_or_college_address"
    t.string   "school_or_college_phone_no"
    t.string   "student_attendance_type"
    t.date     "finance_start_year_date"
    t.date     "finance_end_year_date"
    t.string   "language"
    t.string   "time_zone"
    t.string   "country"
    t.string   "network_state"
    t.string   "include_grading_system"
    t.integer  "addmission_number_auto_increament"
    t.integer  "employee_number_auto_increament"
    t.string   "enable_news_comment_moderation"
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

  create_table "group_batches", force: true do |t|
    t.integer  "batch_group_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_batches", ["batch_group_id"], name: "index_group_batches_on_batch_group_id", using: :btree
  add_index "group_batches", ["batch_id"], name: "index_group_batches_on_batch_id", using: :btree

  create_table "grouped_exam_reports", force: true do |t|
    t.integer  "batch_id"
    t.integer  "student_id"
    t.integer  "exam_group_id"
    t.decimal  "marks"
    t.string   "score_type"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouped_exam_reports", ["batch_id"], name: "index_grouped_exam_reports_on_batch_id", using: :btree
  add_index "grouped_exam_reports", ["exam_group_id"], name: "index_grouped_exam_reports_on_exam_group_id", using: :btree
  add_index "grouped_exam_reports", ["student_id"], name: "index_grouped_exam_reports_on_student_id", using: :btree
  add_index "grouped_exam_reports", ["subject_id"], name: "index_grouped_exam_reports_on_subject_id", using: :btree

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

  create_table "individual_payslip_categories", force: true do |t|
    t.integer  "employee_id"
    t.date     "salary_date"
    t.string   "name"
    t.string   "amount"
    t.boolean  "is_deduction"
    t.boolean  "include_every_month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individual_payslip_categories", ["employee_id"], name: "index_individual_payslip_categories_on_employee_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liabilities", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "amount"
    t.boolean  "is_solved",   default: false
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_payslips", force: true do |t|
    t.date     "salary_date"
    t.integer  "employee_id"
    t.integer  "payroll_category_id"
    t.string   "amount"
    t.boolean  "is_approved",         default: false, null: false
    t.integer  "approver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthly_payslips", ["approver_id"], name: "index_monthly_payslips_on_approver_id", using: :btree
  add_index "monthly_payslips", ["employee_id"], name: "index_monthly_payslips_on_employee_id", using: :btree
  add_index "monthly_payslips", ["payroll_category_id"], name: "index_monthly_payslips_on_payroll_category_id", using: :btree

  create_table "newscasts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "online_exam_questions", force: true do |t|
    t.integer  "online_exam_id"
    t.string   "question"
    t.integer  "marks"
    t.integer  "is_answer"
    t.string   "option_group",   array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "online_exam_questions", ["online_exam_id"], name: "index_online_exam_questions_on_online_exam_id", using: :btree

  create_table "online_exams", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.time     "maximum_time"
    t.decimal  "percentage"
    t.integer  "option_per_question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payroll_categories", force: true do |t|
    t.string   "name"
    t.float    "percentage"
    t.integer  "payroll_category_id"
    t.boolean  "is_deduction"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payroll_categories", ["payroll_category_id"], name: "index_payroll_categories_on_payroll_category_id", using: :btree

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

  create_table "student_category_fee_collection_discounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_category_fee_discounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_fee_collection_discounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_fee_discounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "weekday_id"
    t.integer  "class_timing_id"
    t.integer  "subject_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_table_id"
  end

  add_index "time_table_entries", ["batch_id"], name: "index_time_table_entries_on_batch_id", using: :btree
  add_index "time_table_entries", ["class_timing_id"], name: "index_time_table_entries_on_class_timing_id", using: :btree
  add_index "time_table_entries", ["employee_id"], name: "index_time_table_entries_on_employee_id", using: :btree
  add_index "time_table_entries", ["subject_id"], name: "index_time_table_entries_on_subject_id", using: :btree
  add_index "time_table_entries", ["time_table_id"], name: "index_time_table_entries_on_time_table_id", using: :btree
  add_index "time_table_entries", ["weekday_id"], name: "index_time_table_entries_on_weekday_id", using: :btree

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
    t.string   "role"
    t.string   "student_id"
    t.string   "employee_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "weekdays", force: true do |t|
    t.integer  "batch_id"
    t.string   "weekday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weekdays", ["batch_id"], name: "index_weekdays_on_batch_id", using: :btree

end
