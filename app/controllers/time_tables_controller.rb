class TimeTablesController < ApplicationController
  def index
    @timetable = TimeTable.new
    authorize! :read, @timetable
  end

  def employee_timetable
    @timetables = []
    @employee = Employee.find(params[:format])
    @time_table_entries = TimeTableEntry.emp(@employee)
    @timetables = TimeTableEntry.emptime(@time_table_entries)
    authorize! :read, @employee
  end

  def new
    @timetables = TimeTable.all
    authorize! :read, @timetables.first
  end

  def selectTime
    @time = TimeTableEntry.time(params[:time][:id])
    @time1 = TimeTable.find(params[:time][:id])
    @batches = TimeTableEntry.select(@time)
    authorize! :read, @time1
  end

  def select
    @time1 = TimeTable.find(params[:t])
    @batch = Batch.find(params[:batch][:id])
    @class_timing = @batch.class_timings.is_break
    @subjects = @batch.subjects.all
    authorize! :read, @time1
  end

  def timetable
    @today = Date.today
    @time_end = TimeTable.all
    @time_table = TimeTable.inst(@today)
    @batches = Batch.all
    authorize! :read, @time_end.first
  end

  def display_institutional_time_table
    @time_end = TimeTable.all
    @today = params[:next].to_date
    @batches = Batch.all
    @time_table = TimeTable.inst_next(@today)
    authorize! :read, @time_end.first
  end

  def selectTimeEmployee
    @employee = Employee.find(params[:format])
    @time = TimeTableEntry.where(employee_id: @employee.id)
    all = TimeTableEntry.selectemp(@time)
    @weekdays = all[0]
    @class_timings = all[1]
    @employees = all[2]
    authorize! :read, TimeTable
  end

  def time_table_pdf
    @time1 = TimeTable.find(params[:t])
    @time = TimeTableEntry.timepdf(params[:time_id])
    @batch = Batch.find(params[:batch_id])
    @subjects = @batch.subjects.all
    @general_setting = GeneralSetting.first
    render 'time_table_pdf', layout: false
 end

  def teacher_time_table_display
    @time = TimeTableEntry.time(params[:time][:id])
    @time_table = TimeTable.find(params[:time][:id])
    @timetable_entries = @time_table.time_table_entries
    @weekdays = @timetable_entries.collect(&:weekday) \
                .uniq.sort! { |a, b| a.weekday <=> b.weekday }
    @class_timings = @timetable_entries.collect(&:class_timing) \
                     .uniq.sort! { |a, b| a.start_time <=> b.start_time }
    @employees = @timetable_entries.collect(&:employee).uniq
    authorize! :read, @time_table
  end

  def sub
    @subject = @batch.subjects.find(params[:subject][:id])
    authorize! :create, TimeTable
  end

  def teachers_timetable
    @timetables = TimeTable.all
    authorize! :read, @timetables.first
  end

  def work_allotment
    @employees = Employee.all
    @emp_subs = []
    if request.post?
      params[:employee_subjects]
      @error_obj = EmployeeSubject.allot_work(params[:employee_subjects])
      flash[:notice] = 'Updated work allotment.'
    end
    @batches = Batch.all
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
    unless @error
      @time_table.save ? (redirect_to time_table_entries_path(@time_table)) : (render 'new_timetable')
    else
      render 'new_timetable'
    end
  end

  def edit_timetable
    @courses = Batch.all
    @timetables = TimeTable.all
    authorize! :update, @timetables.first
  end

  def update_timetable
    @time_table = TimeTable.find(params[:format])

    @current = false
    if @time_table.start_date <= Date.today && @time_table.end_date >= Date.today
      @current = true
    end

    if @time_table.start_date > Date.today && @time_table.end_date > Date.today
      @removable = true
    end
  end

  def time_table_delete
    authorize! :delete, @time
    @time = TimeTable.find(params[:format])
    if @time.destroy
      redirect_to time_tables_path
      flash[:notice] = 'Timetable deleted successfully'
    end
  end

  def update_timetable_values
    @timetable = TimeTable.find(params[:format])
    if @timetable.update(time_table)
      flash[:notice] = 'Updated Successfully'
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
