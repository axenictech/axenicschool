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
end
