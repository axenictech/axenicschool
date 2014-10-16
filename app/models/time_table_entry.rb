class TimeTableEntry < ActiveRecord::Base
  belongs_to :course
  belongs_to :batch
  belongs_to :class_timing
  belongs_to :subject
  belongs_to :employee
  belongs_to :weekday
  belongs_to :time_table
end
