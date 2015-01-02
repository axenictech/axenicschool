# Time Table Entry Model
class TimeTableEntry < ActiveRecord::Base
  belongs_to :course
  belongs_to :batch
  belongs_to :class_timing
  belongs_to :subject
  belongs_to :employee
  belongs_to :weekday
  belongs_to :time_table
  scope :shod, ->(id) { where(id: id).take }
  scope :attendance, ->(s, b) { where(subject_id: s.id, batch_id: b.id) }
  scope :employees, ->(employee) { where(employee_id: employee.id) }
  scope :timetables, ->(time) { where(time_table_id: time) }
  scope :time_table_pdf, ->(pdf) { where('batch_id like ?', pdf) }
  
  def self.max_day(emp, week, time)
   TimeTableEntry.where(employee_id: emp.id, weekday_id: week, time_table_id: time).count >= emp.employee_grade.max_hours_day
  end

  def self.max_week(emp, time)
    TimeTableEntry.where(employee_id: emp.id, time_table_id: time).count < emp.employee_grade.max_hours_week
  end
  def self.max_subject(subject, time)
    TimeTableEntry.where(subject_id: subject.id, time_table_id: time).count >= subject.max_weekly_classes
  end
  def self.select_time_table(time_table)
    batches = []
    unless time_table.nil?
      time_table.each do |t|
        batches.push t.batch
      end
      batches
    end
  end

<<<<<<< HEAD
  def self.selectemp(e)
    all = []
    weekdays = []
    class_timings = []
    employees = []
    unless e.nil?
      e.each do |t|
        weekdays.push t.weekday
        class_timings.push t.class_timing
        employees.push t.employee
      end
    end
    all << weekdays
    all << class_timings
    all << employees
    all
  end
  def self.selecttime(_e)
    weekdays = []
    class_timings = []
    employees = []
    unless time.nil?
      time.each do |t|
        weekdays.push t.weekday
        class_timings.push t.class_timing
        employees.push t.employee
=======
  def self.select_employee(e)
    weekdays, class_timings, employees = [], [], []
    unless e.nil?
      e.each do |t|
        weekdays << t.weekday
        class_timings << t.class_timing
        employees << t.employee
>>>>>>> 453b8e6e16f6c48149a8b9386dda7bd3d1fd83cc
      end
    end
    [weekdays, class_timings, employees]
  end

<<<<<<< HEAD
  def self.emptime(t)
    timetables = []
    t.each do |tbe|
=======
def self.employee_time_table(timetable)
    timetables = []
    timetable.each do |tbe|
>>>>>>> 453b8e6e16f6c48149a8b9386dda7bd3d1fd83cc
      timetables << tbe.time_table
    end
    timetables
  end
end
