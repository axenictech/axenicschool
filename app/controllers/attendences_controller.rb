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
        @today = Date.today
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def new_attendence
           @attendence = Attendence.new
           @student = Student.find(params[:student_id])
          
           
    end

    def create
    	@today = Date.today
    	@student = Student.find(params[:student_id])
    	@reason = params[:attendence][:reason]
     
       
        @batch=@student.batch
        @students=@batch.students.all
     
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
        @attendence = Attendence.create(reason:@reason,student_id:@student.id)  
       
    end

    def display

        @batch=Batch.find(params[:batch_id])
        @students=@batch.students.all
        @today = params[:next].to_date
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

   
end
