class TimeTableEntriesController < ApplicationController

 def index
   @time=TimeTable.find(params[:format])
   @batches=Batch.all
   @sub=params[:sub_id]
   @times=params[:time_id]
 end

 def select
    @time=params[:format]
    @batch=Batch.find(params[:batch][:id])
    @subjects=@batch.subjects.all
 end
def select_subject
    @subject=Subject.find(params[:sub][:subject_id])
    @teachers= EmployeeSubject.where(subject_id: @subject.id)
 end
 def assign_time
    @class_timing_id=params[:timing_id]
    @weekday=params[:weekday_id]
    @teacher=params[:teacher]
    @time=params[:time_table_id]
    @subject=Subject.find(params[:subject_id])
    @batch=@subject.batch
    @assign_time=TimeTableEntry.create(batch_id:@batch.id,class_timing_id:@class_timing_id,weekday_id:@weekday,employee_id:@teacher,subject_id:@subject.id,time_table_id:@time)
    @subjects = @batch.subjects.all
    @teachers= EmployeeSubject.where(subject_id: @subject.id)
    
 end

  def delete_time
    @delete_time=TimeTableEntry.find(params[:format])
    @delete_time.destroy
    @batch=@delete_time.batch
    @subjects=@batch.subjects.all
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

