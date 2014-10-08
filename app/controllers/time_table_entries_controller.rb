class TimeTableEntriesController < ApplicationController
def index
  	@batches=Batch.all
  	 @sub=params[:sub_id]
  	 @times=params[:time_id]
end

def select
	    @batch = Batch.find(params[:batch][:id])
	    @subjects = @batch.subjects.all
end

def select_subject
	   @subject=Subject.find(params[:subject][:subject_id])
     @teachers= EmployeeSubject.where(subject_id: @subject.id)
     a=params[:teachers]
end

def assign_time
    @time=params[:timing_id]
    @weekday=params[:weekday_id]
    @teacher=params[:teacher]
    @subject=params[:subject_id]
    @subject1=Subject.find(params[:subject_id])
    @batch=@subject1.batch.id
    @assign_time=TimeTableEntry.create(batch_id:@batch,class_timing_id:@time,weekday_id:@weekday,employee_id:@teacher,subject_id:@subject)
end

def new
    @timetable=TimeTable.find(params[:format])
    @batches = Batch.all
end

private 
   def time_table
	   params.require(:time_table).permit(:start_date,:end_date,:is_active)
   end
end

