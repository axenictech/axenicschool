class TimeTable < ActiveRecord::Base

	has_many :time_table_entries, dependent: :destroy
    has_many :time_table_entries, dependent: :destroy
    has_many :timetable_entries, dependent: :destroy
end
