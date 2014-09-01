class TimeTable < ActiveRecord::Base
	has_many :timetable_entries, dependent: :destroy
end
