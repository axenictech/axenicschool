class TimeTablesController < ApplicationController

	
	def new
 		 @batches=Batch.all
	end

	def select
	    @batch = Batch.find(params[:batch][:id])
	    @subjects = @batch.subjects.all
        
	end

	def sub
  		 @subject=@batch.subjects.find(params[:subject][:id])
	end

	def timetable
		@batches=Batch.all
		#@today = params[:next].to_date
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
       @timetable=TimeTable.new
      end

      def create
       @time_table=TimeTable.new(time_table)
       if @time_table.save
       	 redirect_to time_table_entries_path(@time_table)
       end
     end
      
      private 
      def time_table
	       params.require(:time_table).permit(:start_date,:end_date,:is_active)
      end
 end


 