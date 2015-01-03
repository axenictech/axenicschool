# Time Table Entries Controller
class TimeTableEntriesController < ApplicationController
  def index
    @time = TimeTable.shod(params[:format])
    flash[:notice] = t('time_table') + "#{@time.start_date} - #{@time.end_date}"
    @batches = Batch.includes(:course).all
    authorize! :read, @time
  end

  def select
    @time = params[:format]
    @batch = Batch.find(params[:batch][:id])
    @class_timing = @batch.class_timings.is_break
    @subjects = @batch.subjects.all
    authorize! :read, TimeTableEntry
  end

  def select_subject
    @subject = Subject.find(params[:sub][:subject_id])
    @teachers = EmployeeSubject.where(subject_id: @subject.id)
    authorize! :read, TimeTableEntry
  end

  def assign_time
    @class_timing_id = params[:timing_id]
    @weekday = params[:weekday_id]
    @teacher = params[:teacher]
    @time = params[:time_table_id]
    @subject = Subject.shod(params[:subject_id])
    @em = Employee.shod(params[:teacher])
    @batch = @subject.batch
    if TimeTableEntry.max_day(@em, @weekday, @time)
      flash[:alert] = t('max_hours_day_exceeded')
    else
      if TimeTableEntry.max_week(@em, @time)
        if TimeTableEntry.max_subject(@subject, @time)
          flash[:alert] = t('subject_exceeded')
        else
          @assign_time = TimeTableEntry.create(batch_id: @batch.id, class_timing_id: @class_timing_id, weekday_id: @weekday, employee_id: @teacher, subject_id: @subject.id, time_table_id: @time)
        end
      else
        flash[:alert] = t('max_hours_week_exceeded')
      end
    end
    @time = params[:time_table_id]
    @subjects = @batch.subjects.all
    @class_timing = @batch.class_timings.is_break
    @teachers = EmployeeSubject.where(subject_id: @subject.id)
  end

  def delete_time
    authorize! :delete, @delete_time
    @delete_time = TimeTableEntry.find(params[:format])
    @delete_time.destroy
    @batch = @delete_time.batch
    @class_timing = @batch.class_timings.is_break
    @subjects = @batch.subjects.all
    @time = @delete_time.time_table.id
    redirect_to dashboard_home_index_path
  end

  def new
    @timetable = TimeTable.find(params[:format])
    @batches = Batch.all
    authorize! :create, @timetable
  end

  private

  def time_table
    params.require(:time_table).permit(:start_date, :end_date, :is_active)
  end
end
