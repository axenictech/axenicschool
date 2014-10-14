class TimeTablesController < ApplicationController

	
	def new
 		@timetables=TimeTable.all

  end

  def selectTime
    @time=TimeTableEntry.where(time_table_id:params[:time][:id])
    @batches=[]
    unless @time.nil?
    @time.each do |t|
     @batches.push t.batch
    end
  end
  end

  def teacher_time_table_display
    @time=TimeTableEntry.where(time_table_id:params[:time][:id])
    @weekdays=[]
    @class_timings=[]
    @employees=[]
    unless @time.nil?
     @time.each do |t|
     @weekdays.push t.weekday
     @class_timings.push t.class_timing
     @employees.push t.employee
   end

 end
end
  
 def select
    unless @time.nil?
    @time.each do |t|
     @weekdays.push t.weekday
   end
 end

  end

	def select
	   @batch = Batch.find(params[:batch][:id])
	   @subjects = @batch.subjects.all
  end

	def sub
  		 @subject=@batch.subjects.find(params[:subject][:id])
	end

  def teachers_timetable
     @timetables=TimeTable.all
  end
  def timetable
		@batches=Batch.all
	end
  def work_allotment
    @employees = Employee.all
    @emp_subs = []
    if request.post?
      params[:employee_subjects]
      @error_obj = EmployeeSubject.allot_work(params[:employee_subjects])
    end
      @batches = Batch.all
      @subjects = @batches.collect(&:subjects).flatten
  end

  def new_timetable
    @time_table=TimeTable.new
  end

  def create
    @time_table=TimeTable.new(time_table)
     @error=false
     previous=TimeTable.where("end_date >= ? AND start_date <= ?",@time_table.start_date,@time_table.start_date)
      unless previous.empty?
        @error=true
        @time_table.errors.add(:start_date,'is within the range of another timetable')
      end
      foreword=TimeTable.where("end_date >= ? AND start_date <= ?",@time_table.end_date,@time_table.end_date)
      unless foreword.empty?
        @error=true
        @time_table.errors.add(:end_date,'is within the range of another timetable')
      end
     fully_overlapping =TimeTable.where("end_date <= ? AND start_date >= ?",@time_table.end_date,@time_table.start_date)
     unless fully_overlapping.empty?
        @error=true
        @time_table.errors.add(:end_date,"timetable_in_between_given_dates")
     end
     if @time_table.end_date < @time_table.start_date
        @error=true
        @time_table.errors.add(:end_date, "can't be less than start date")
     end
     unless @error
        if @time_table.save
       	   redirect_to time_table_entries_path(@time_table)
        else
          render 'new_timetable'
        end
     else
          render 'new_timetable'
     end
  end
      
   private 
   def time_table
	       params.require(:time_table).permit(:start_date,:end_date,:is_active)
      end
 end


 