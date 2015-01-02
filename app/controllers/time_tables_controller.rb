# Time Table Controller
class TimeTablesController < ApplicationController
  def index
    @timetable = TimeTable.new
    authorize! :read, @timetable
  end

  def employee_timetable
    @timetables = []
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
    @time1 = TimeTable.find(params[:time][:id])
    @batches = TimeTableEntry.select_time_table(@time)
    authorize! :read, @time1
  end

  def select
    @time1 = TimeTable.find(params[:t])
    @batch = Batch.find(params[:batch][:id])
    @class_timing = @batch.class_timings.is_break
    @subjects ||= @batch.subjects.all
    authorize! :read, @time1
  end

  def timetable
    @today = Date.today
    @time_end = TimeTable.all
    @time_table = TimeTable.time_table_date(@today)
    @batches = Batch.all
    authorize! :read, @time_end.first
  end

  def display_institutional_time_table
    @time_end = TimeTable.all
    @today = params[:next].to_date
    @batches = Batch.all
    @time_table = TimeTable.time_table_date(@today)
    authorize! :read, @time_end.first
  end

  def select_time_employee
    @employee = Employee.find(params[:format])
    time_table = TimeTable.find(params[:time][:id])
    @timetable_entries = time_table.time_table_entries
    @batches = @timetable_entries.collect(&:batch).uniq
    @weekdays = TimeTable.weekday_teacher(@timetable_entries)
    @class_timings = TimeTable.class_teacher(@timetable_entries)
    authorize! :read, @time_table
  end

  def time_table_pdf
    @time1 = TimeTable.find(params[:t])
    @time = TimeTableEntry.time_table_pdf(params[:time_id])
    @subjects ||= @batch.subjects.all
    @general_setting = GeneralSetting.first
    render 'time_table_pdf', layout: false
  end

  def teacher_time_table_display
    @time = TimeTableEntry.timetables(params[:time][:id])
    @time_table = TimeTable.find(params[:time][:id])
    @timetable_entries = @time_table.time_table_entries
    @weekdays = TimeTable.weekday_teacher(@timetable_entries)
    @class_timings = TimeTable.class_teacher(@timetable_entries)
    @employees = TimeTable.employee_teacher(@timetable_entries)
    authorize! :read, @time_table
  end

  def sub
    @subject = @batch.subjects.find(params[:subject][:id])
    authorize! :create, TimeTable
  end

  def teachers_timetable
    @timetables ||= TimeTable.all
    authorize! :read, @timetables.first
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
    @time_table = TimeTable.find(params[:format])
    @time_table.update_time(@time_table)
  end

  def time_table_delete
    authorize! :delete, @time
    @time = TimeTable.find(params[:format])
    @time.destroy
    redirect_to time_tables_path
    flash[:notice] = t('timetable_delete')
  end

  def update_timetable_values
    @timetable = TimeTable.find(params[:format])
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
