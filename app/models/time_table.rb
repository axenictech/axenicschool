class TimeTable < ActiveRecord::Base

	# has_many :time_table_entries, dependent: :destroy
    has_many :time_table_entries, dependent: :destroy
    # has_many :timetable_entries, dependent: :destroy

    # def self.tte_for_the_day(batch,date)
    #    entries=TimeTableEntry.joins(:time_table,:class_timing,:weekday).where(["(time_tables.start_date <= ? AND time_tables.end_date >= ?)  AND time_table_entries.batch_id = ? AND class_timings.is_deleted = false AND weekdays.is_deleted = false",date,date,batch.id])
    #   today=entries.select{|a| a.day_of_week==date.wday}
    # end
end
