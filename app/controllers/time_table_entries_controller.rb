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
    @batch = Batch.shod(params[:batch][:id])
    @class_timing = @batch.class_timings.is_break
    @subjects = @batch.subjects.all
    authorize! :read, TimeTableEntry
  end

  def select_subject
    @subject = Subject.shod(params[:sub][:subject_id])
    @teachers = EmployeeSubject.where(subject_id: @subject.id)
    @emp = EmployeeSubject.where(subject_id: @subject.id, employee_id: nil)
    authorize! :read, TimeTableEntry
  end

  def assign_time
    @class_timing_id = params[:timing_id]
    @weekday = params[:weekday_id]
    @teacher = params[:teacher]
    @time = params[:time_table_id]
    assign_time2(params[:subject_id], params[:teacher])
    assign_time3(params[:time_table_id])
  end

  def assign_time2(subject_id, teacher)
    @subject = Subject.shod(subject_id)
    @em = Employee.shod(teacher)
    @batch = @subject.batch
    if TimeTableEntry.max_day(@em, @weekday, @time)
      flash[:alert] = t('max_hours_day_exceeded')
    else
      assign_time4
    end
  end

  def assign_time3(time_table_id)
    @time = time_table_id
    @subjects = @batch.subjects.all
    @class_timing = @batch.class_timings.is_break
    @teachers = EmployeeSubject.where(subject_id: @subject.id)
  end

  def assign_time4
    if TimeTableEntry.max_week(@em, @time)
      if TimeTableEntry.max_subject(@subject, @time)
        flash[:alert] = t('subject_exceeded')
      else
        assign_time5
      end
    else
      flash[:alert] = t('max_hours_week_exceeded')
    end
  end

  def assign_time5
    @assign_time = TimeTableEntry.create(batch_id: @batch.id\
          , class_timing_id: @class_timing_id, weekday_id: @weekday\
          , employee_id: @teacher, subject_id: @subject.id\
          , time_table_id: @time)
  end

  def delete_time
    authorize! :delete, @delete_time
    @delete_time = TimeTableEntry.shod(params[:format])
    @delete_time.destroy
    @batch = @delete_time.batch
    @class_timing = @batch.class_timings.is_break
    @subjects = @batch.subjects.all
    @time = @delete_time.time_table.id
    redirect_to dashboard_home_index_path
  end

  def new
    @timetable = TimeTable.shod(params[:format])
    @batches = Batch.all
    authorize! :create, @timetable
  end

  private

  def time_table
    params.require(:time_table).permit(:start_date, :end_date, :is_active)
  end
end
