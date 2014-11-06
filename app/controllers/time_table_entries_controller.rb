class TimeTableEntriesController < ApplicationController

 def index

   @time=TimeTable.find(params[:format])
   flash[:notice]="Time table structure created from #{@time.start_date.strftime("%B %Y")} - #{@time.end_date}"
   @batches=Batch.all
   @sub=params[:sub_id]
   @times=params[:time_id]
 end

 def select
    @time=params[:format]
    @batch=Batch.find(params[:batch][:id])
    @class_timing=@batch.class_timings.where(:is_break=>false)
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
    @em=Employee.find(params[:teacher])
    @batch=@subject.batch

 unless TimeTableEntry.where(:employee_id=>@em.id,:weekday_id=>@weekday,:time_table_id=>@time).count >= @em.employee_grade.max_hours_day 
    if TimeTableEntry.where(:employee_id=>@em.id,:time_table_id=>@time).count < @em.employee_grade.max_hours_week
          
     if TimeTableEntry.where(:subject_id=>@subject.id,:time_table_id=>@time).count >= @subject.max_weekly_classes
          flash[:alert]="Warning : Weekly subject limit reached"
      else
        @assign_time=TimeTableEntry.create(batch_id:@batch.id,class_timing_id:@class_timing_id,weekday_id:@weekday,employee_id:@teacher,subject_id:@subject.id,time_table_id:@time)
     end
      else
        flash[:alert]="Warning : Max hours per week exceeded" 
   end
  else
      flash[:alert]="Warning : Max hours per day exceeded"
  end


    @time=params[:time_table_id]
    @subjects = @batch.subjects.all
    @class_timing=@batch.class_timings.where(:is_break=>false)
    @teachers= EmployeeSubject.where(subject_id: @subject.id)
 end

  def delete_time
    @delete_time=TimeTableEntry.find(params[:format])
    @delete_time.destroy
    @batch=@delete_time.batch
    @class_timing=@batch.class_timings.where(:is_break=>false)
    @subjects=@batch.subjects.all
    @time=@delete_time.time_table.id
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
