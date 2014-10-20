class AttendencesController < ApplicationController

    def attendence_register
 		@batches=Batch.all
    end

    def select_subject
      	@batch=Batch.find(params[:batch][:id])
    	@subjects=@batch.subjects.all
    end

    def select
      	@subject=Subject.find(params[:subject][:id])
        @batch=@subject.batch
        @students=@batch.students.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@batch.id)
        @today = Date.today     
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def display
        @subject=Subject.find(params[:subject_id])
        @batch=@subject.batch
        @students=@batch.students.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@batch.id)
        @today = params[:next].to_date
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def new_attendence
        @attendence = Attendence.new
        @student = Student.find(params[:student_id])
        @date = params[:month_date]
        @time_table_entry_id=params[:time_table_entry_id]
        @subject_id=params[:subject_id]  
    end

    def create
        @today=params[:attendence][:month_date].to_date
        @attendence = Attendence.new(attendence_params)
        @attendence.save

        @subject=Subject.find(params[:subject_id])
        @batch= @attendence.batch
        @students=@batch.students.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@batch.id)
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def edit_attendence
        @attendence=Attendence.find(params[:id]) 
        @student = Student.find(@attendence.student_id)
        @subject_id=params[:subject_id]
        @today=params[:date]  
    end

    def update_attendence
        @attendence=Attendence.find(params[:id])
        @attendence.update(attendence_params)
        @today=params[:date].to_date  
        @subject=Subject.find(params[:subject_id])
        @batch= @attendence.batch
        @students=@batch.students.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@batch.id)
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def delete_attendence
        @today=params[:date].to_date  
        @subject=Subject.find(params[:subject_id])
        @batch= Batch.find(params[:batch])

        @attendence=Attendence.find(params[:id])
        @attendence.destroy

        @students=@batch.students.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@batch.id)
        @start_date = @today.beginning_of_month
        @end_date = @today.end_of_month
    end

    def select_batch
        @batch=Batch.find(params[:batch][:id])
        @subjects=@batch.subjects.all
    end

    def generate_report
        @subject=Subject.find(params[:report][:subject_id])
        @start_date=params[:report][:start_date]
        @end_date=params[:report][:end_date]
        @students=@subject.batch.students.all
        @batch_events=@subject.batch.batch_events.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@subject.batch.id)
    end

    def attendence_report
        @general_setting=GeneralSetting.first
        @subject=Subject.find(params[:subject_id])
        @start_date=params[:start_date]
        @end_date=params[:end_date]
        @batch=@subject.batch
        @students=@batch.students.all
        @batch_events=@batch.batch_events.all
        @time_table_entries=TimeTableEntry.where(subject_id:@subject.id,batch_id:@batch.id)
        render 'attendence_report',layout:false
    end

    private
    def attendence_params
        params.require(:attendence).permit!
    end
end
