class TimeTable < ActiveRecord::Base

	# has_many :time_table_entries, dependent: :destroy
    has_many :time_table_entries, dependent: :destroy
    # has_many :timetable_entries, dependent: :destroy
    # validate :start_date
    # validate :end_date
    # validate :start_date_and_end_date
    # def self.tte_for_the_day(batch,date)
    #    entries=TimeTableEntry.joins(:time_table,:class_timing,:weekday).where(["(time_tables.start_date <= ? AND time_tables.end_date >= ?)  AND time_table_entries.batch_id = ? AND class_timings.is_deleted = false AND weekdays.is_deleted = false",date,date,batch.id])
    #   today=entries.select{|a| a.day_of_week==date.wday}
    # end

    # def start_date
    # 	if start_date.present?
    # 	previous=TimeTable.where("end_date >= ? AND start_date <= ?",start_date,start_date)
	   #    unless previous.empty?
	   #      errors.add(:start_date,'is within the range of another timetable')
	   #    end
	   # 	end
    # end

  #   def end_date
  #   	if end_date.present?
  #   	if end_date < start_date
  #    		errors.add(:end_date, "can't be less than start date")
		# else    
  #   	previous=TimeTable.where("end_date >= ? AND start_date <= ?",end_date,end_date)
	 #      unless previous.empty?
	 #        errors.add(:end_date,'is within the range of another timetable')
	 #      end
	 #   	end
	 #   	end
  #   end

  #   def start_date_and_end_date
  #   	if start_date.present? and end_date.present?
  #   		timetable=TimeTable.where("end_date <= ? AND start_date >= ?",end_date,start_date)
  #    		unless timetable.empty?
  #       		errors.add(:end_date,"timetable_in_between_given_dates")
  #    		end
  #    	end
  #   end
  
  
  def self.tte_for_the_day(batch,date)
    #entries = TimetableEntry.find(:all,:joins=>[:timetable, :class_timing, :weekday],:conditions=>["(timetables.start_date <= ? AND timetables.end_date >= ?)  AND timetable_entries.batch_id = ? AND class_timings.is_deleted = false AND weekdays.is_deleted = false",date,date,batch.id], :order=>"class_timings.start_time")
    entries= TimeTableEntry.joins(:time_table,:class_timing,:weekday).where("time_tables.start_date<= ? AND time_tables.end_date >=? AND time_table_entries.batch_id = ?",date,date,batch.id)
    if entries.empty?
      today=[]
    else
      today=entries.select{|a| a.weekday.day_of_week==date.wday}
    end
    today
  end

end
