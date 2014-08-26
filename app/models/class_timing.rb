class ClassTiming < ActiveRecord::Base
	has_many :timetable_entries
  belongs_to :batch

end
