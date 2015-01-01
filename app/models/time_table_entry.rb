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
  scope :emp, ->(emp) { where(employee_id: emp.id) }
  scope :time, ->(time) { where(time_table_id: time) }
  scope :timepdf, ->(t) { where('batch_id like ?', t) }
  scope :entries, ->(s, b) { where(subject_id: s, batch_id: b) }

  def self.select(s)
    batches = []
    unless s.nil?
      s.each do |t|
        batches.push t.batch
      end
      batches
 end
 end

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
  def self.selecttime(e)
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
  
  def self.emptime(t)
    timetables=[]
    t.each do |tbe|
      timetables << tbe.time_table
    end
      timetables
  end

end
