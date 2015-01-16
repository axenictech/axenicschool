# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'roo'
ex = Roo::Excelx.new("#{Rails.root}/public/database.xlsx")
ex.default_sheet = ex.sheets[0]
3.upto(1000) do |line|
  a = ex.cell(line, 'A')
  b = ex.cell(line, 'B')
  c = ex.cell(line, 'C')
  Course.create(course_name: a, section_name: b, code: c)
end
ex.default_sheet = ex.sheets[1]
3.upto(1000) do |line|
  a = ex.cell(line, 'A')
  b = ex.cell(line, 'B')
  c = ex.cell(line, 'C')
  d = ex.cell(line, 'D')
  Batch.create(name: a, start_date: b, end_date: c, course_id: d)
end
ex.default_sheet = ex.sheets[2]
3.upto(1000) do |line|
  a = ex.cell(line, 'A')
  Category.create(name: a)
end
ex.default_sheet = ex.sheets[3]
3.upto(1000) do |line|
  a = ex.cell(line, 'A')
  b = ex.cell(line, 'B')
  c = ex.cell(line, 'C')
  d = ex.cell(line, 'D')
  e = ex.cell(line, 'E')
  f = ex.cell(line, 'F')
  Subject.create(name: a, code: b, batch_id: c, max_weekly_classes: d\
  , elective_group_id: e, no_exam: f)
end
