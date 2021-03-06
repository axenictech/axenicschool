# Time Table Controller
class TimeTablesController < ApplicationController
  def employee_timetable
    @employee = Employee.shod(params[:format])
    @time_table_entries = TimeTableEntry.employees(@employee)
    @timetables = TimeTableEntry.employee_time_table(@time_table_entries)
    authorize! :read, @employee
  end

  def new
    @timetables ||= TimeTable.all
    authorize! :read, @timetables.first
  end

  def select_time
    @time = TimeTableEntry.timetables(params[:time][:id])
    @time1 = TimeTable.shod(params[:time][:id])
    @batches = TimeTableEntry.select_time_table(@time)
    authorize! :read, @time1
  end

  def select
    @time1 = TimeTable.shod(params[:t])
    @batch = Batch.shod(params[:batch][:id])
    @class_timing = @batch.class_timings.is_break
    authorize! :read, @time1
  end

  def timetable
    @today = Date.today
    @time_table = TimeTable.time_table_date(@today)
  end

  def display_institutional_time_table
    @today = params[:next].to_date
    @time_table = TimeTable.time_table_date(@today)
  end

  def select_time_employee
    @employee = Employee.shod(params[:format])
    time_table = TimeTable.shod(params[:time][:id])
    @timetable_entries = time_table.time_table_entries
    @weekdays = TimeTable.weekday_teacher(@timetable_entries)
    @class_timings = TimeTable.class_teacher(@timetable_entries)
    authorize! :read, time_table
  end

  def time_table_pdf
    @time1 = TimeTable.shod(params[:t])
    @batch = Batch.shod(params[:batch_id])
    @general_setting = GeneralSetting.first
    render 'time_table_pdf', layout: false
  end

  def teacher_time_table_display
    @time = TimeTableEntry.timetables(params[:time][:id])
    @time_table = TimeTable.shod(params[:time][:id])
    @timetable_entries = @time_table.time_table_entries
    @weekdays = TimeTable.weekday_teacher(@timetable_entries)
    @class_timings = TimeTable.class_teacher(@timetable_entries)
    @employees = TimeTable.employee_teacher(@timetable_entries)
    authorize! :read, @time_table
  end

  def teachers_timetable
    @timetables ||= TimeTable.all
    authorize! :read, @timetables.first
  end

  def teacher_timetable_pdf
    @time_table = TimeTable.shod(params[:time])
    @timetable_entries = @time_table.time_table_entries
    @weekdays = TimeTable.weekday_teacher(@timetable_entries)
    @class_timings = TimeTable.class_teacher(@timetable_entries)
    @employees = TimeTable.employee_teacher(@timetable_entries)
    @general_setting = GeneralSetting.first
    render 'teacher_timetable_pdf', layout: false
  end

  def work_allotment
    @employees ||= Employee.all
    if request.post?
      @error_obj = EmployeeSubject.allot_work(params[:employee_subjects])
      flash[:notice] = t('work_allotment_update')
    end
    @batches ||= Batch.all
    @subjects = @batches.includes(:subjects).flatten
    authorize! :create, TimeTable
  end

  def new_timetable
    @time_table = TimeTable.new
    authorize! :create, @time_table
  end

  def create
    @time_table = TimeTable.new(time_table)
    @error = @time_table.create_time_table(@time_table)
    if @error
      render 'new_timetable'
    else
      @time_table.save
      redirect_to time_table_entries_path(@time_table)
    end
  end

  def edit_timetable
    @courses ||= Batch.all
    @timetables ||= TimeTable.all
    authorize! :update, @timetables.first
  end

  def update_timetable
    @time_table = TimeTable.shod(params[:format])
    @time_table.update_time(@time_table)
  end

  def time_table_delete
    authorize! :delete, @time
    @time = TimeTable.shod(params[:format])
    @time.destroy
    redirect_to time_tables_path
    flash[:notice] = t('timetable_delete')
  end

  def update_timetable_values
    @timetable = TimeTable.shod(params[:format])
    if @timetable.update(time_table)
      flash[:notice] = t('timetable_update')
      redirect_to edit_timetable_time_tables_path(@timetable)
    else
      render 'update_timetable'
    end
  end

  private

  def time_table
    params.require(:time_table).permit(:start_date, :end_date, :is_active)
  end
end
