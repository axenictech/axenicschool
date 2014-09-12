class BatchTransfersController < ApplicationController
  
  def index
     @courses=Course.all
     @course=Course.new
        
  end
  def select
     @course = Course.find(params[:batch_transfer][:id])
  end
  
  def transfer
      @batch=Batch.find(params[:batch_id])
      @batchs=Batch.all
      @students=@batch.students.all
  end

  def assign_all
    @batch=Batch.find(params[:format])
    @students=@batch.students.all
  end

  def remove_all
    @batch=Batch.find(params[:format])
    @students=@batch.students.all
  end

  def student_transfer
    @batch=Batch.find(params[:transfer][:batch_id])
    transfer_batch_id=params[:transfer][:id]
    students=params[:students]
    if students.present?
         students.each  do |student|
            @student=Student.find(student)
            @student.update(batch_id: transfer_batch_id)
          end
    flash[:notice_transfer] = "Students transfer successfully"
    else
    flash[:notice_transfer] = "Please select student"
    end
    redirect_to batch_transfers_transfer_path(@batch)
  end

  def graduation
     @batch=Batch.find(params[:batch_id])
     @students=@batch.students.all
  end

  def former_student
     @batch=Batch.find(params[:graduate][:batch_id])
     status=params[:graduate][:status_description]
     students=params[:students]
      if students.present?
         students.each  do |student|
            @student=Student.find(student)
            @archived_student=ArchivedStudent.new(student_id: student,status_description: status,
                admission_no: @student.admission_no,admission_date: @student.admission_date,first_name: @student.first_name,
                middle_name: @student.middle_name,last_name: @student.last_name, batch_id: @student.batch_id,
                date_of_birth: @student.date_of_birth,blood_group: @student.blood_group,birth_place: @student.birth_place,
                nationality_id: @student.nationality_id,language: @student.language,category_id: @student.category_id,
                religion: @student.religion,address_line1: @student.address_line1,address_line2: @student.address_line2,
                city: @student.city,state: @student.state,pin_code: @student.pin_code,country_id: @student.country_id,
                phone1: @student.phone1,phone2: @student.phone2,email: @student.email,photo_data: @student.photo_data)
            @archived_student.save
            @student.destroy
          end
    flash[:notice_gradute] = "Students trasferred to former students database successfully"
    else
    flash[:notice_gradute] = "Please select student"
    end
    redirect_to batch_transfers_graduation_path(@batch)
  end
end