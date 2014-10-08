class AttendencesController < ApplicationController

    def attendance_register
 		@attendence=Attendence.new
    end

    def select_subject
      	@batch=Batch.find(params[:batch][:batch_id])

    	@subject=@batch.subjects.all
    	@today = Date.today
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def select
      	@batch=Batch.find(params[:format])
        @students=@batch.students.all
         @time_table_entries=TimeTableEntry.where(subject_id:params[:demo][:subject_id])
       
        @today = Date.today
        @dates=@batch.weekdays.all
       
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def new_attendence
        @attendence = Attendence.new
        @student = Student.find(params[:student_id])
     
        @date = params[:month_date]
       
      
    end

    def create
    	@today = Date.today
    	@student = Student.find(params[:student_id])
        @date = params[:month_date]
    	@reason = params[:attendence][:reason]
        @batch=@student.batch
        @students=@batch.students.all
        @dates=@batch.weekdays.all
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
        @attendence = Attendence.create(reason:@reason,student_id:@student.id,month_date:@date)  
    end

    def edit_attendence
        @attendence=Attendence.find(params[:id]) 
        @student = Student.find(@attendence.student_id)      
    end

    def update_attendence
        @attendence=Attendence.find(params[:id])
        @student=Student.find(@attendence.student_id)
        @reason = params[:attendence][:reason]
     attendence.update(reason:@reason,student_id:@student.id,month_date:@date)
       
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end


    def display
        @batch=Batch.find(params[:batch_id])
        @students=@batch.students.all
        @dates=@batch.weekdays.all
        @today = params[:next].to_date
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end
end
