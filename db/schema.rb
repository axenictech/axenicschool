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
ActiveRecord::Schema.define(version: 20140806113324) do
=======
ActiveRecord::Schema.define(version: 20140807065345) do
>>>>>>> b787826bfaf5c6100c11e9ef4d59e8deefa24eda

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "grading_levles", force: true do |t|
    t.string   "name"
    t.integer  "min_score"
    t.string   "description"
=======
  create_table "electivegroups", force: true do |t|
    t.string   "name"
>>>>>>> b787826bfaf5c6100c11e9ef4d59e8deefa24eda
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "gradinglevles", force: true do |t|
    t.string   "name"
    t.integer  "min_score"
    t.string   "description"
=======
  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "max_weekily_classes"
    t.decimal  "credit_hours"
    t.boolean  "no_exams"
>>>>>>> b787826bfaf5c6100c11e9ef4d59e8deefa24eda
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
