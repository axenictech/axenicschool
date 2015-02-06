# Time Table Entry Model
class TimeTableEntry < ActiveRecord::Base
  include Activity
  belongs_to :course
  belongs_to :batch
  belongs_to :class_timing
  belongs_to :subject
  belongs_to :employee
  belongs_to :weekday
  belongs_to :time_table
  scope :shod, ->(id) { where(id: id).take }
  scope :attendance, ->(s, b) { where(subject_id: s.id, batch_id: b.id) }
  scope :employees, ->(employee) { where(employee_id: employee.id).includes(:time_table) }
  scope :timetables, ->(time) { where(time_table_id: time) }

  def self.max_day(emp, week, time)
    TimeTableEntry.where(employee_id: emp.id, weekday_id: \
    week, time_table_id: time).count >= emp.employee_grade.max_hours_day
  end

  def self.max_week(emp, time)
    TimeTableEntry.where(employee_id: emp.id, time_table_id: \
    time).count < emp.employee_grade.max_hours_week
  end
  def self.max_subject(subject, time)
    TimeTableEntry.where(subject_id: subject.id, time_table_id: \
    time).count >= subject.max_weekly_classes
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

  def self.select_employee(e)
    weekdays, class_timings, employees = [], [], []
    unless e.nil?
      e.each do |t|
        weekdays << t.weekday
        class_timings << t.class_timing
        employees << t.employee
      end
    end
    [weekdays, class_timings, employees]
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
      end
    end
  end

  def self.employee_time_table(timetable)
    timetables = []
    timetable.each do |tbe|
      timetables << tbe.time_table
    end
    timetables
  end

  def self.entries(subject, batch)
    where(subject_id: subject, batch_id: batch)
  end
end
