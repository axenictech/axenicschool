class StudentsController < ApplicationController

	def admission1
	 	
        @student = Student.new
      
  	end

   	def create
     	@student = Student.new(student_params)
	     @student.save
	     redirect_to students_admission2_path(@student)
    end
  
    def show
        @student =Student.find(params[:id])
    end

	def admission2
		@student=Student.find(params[:format])

	end

	def admission2_1
		@student=Student.find(params[:format]) 

	end

	def admission3
		@student=Student.find(params[:format])
	end

	def edit
		@student=Student.find(params[:id])
	end
	
	def update
		@student=Student.find(params[:id])
		@student.update(student_params)
		redirect_to students_profile_path(@student)
	end

	def update_immediate_contact
		@student=Student.find(params[:id])
		@student.update(student_params)
		redirect_to students_previous_data_path(@student)
	end

	def previous_data
		@student=Student.find(params[:format])
	end

	def previous_data_create
		@previous_data=StudentPreviousData.create(previous_data_params)
		@student=params[:student_previous_data][:student_id]
		redirect_to students_profile_path(@student)
	end

	def add_subject
		@student=Student.find(params[:format])
	end

	def previous_subject_create
		@previous_subject=StudentPreviousSubjectMark.create(params_subject)
		@student=params[:student_previous_subject_mark][:student_id]
		redirect_to students_previous_data_path(@student)
	end

	def search_ajax

		@students=Student.where("first_name='#{params[:search]}' OR last_name='#{params[:search]}'")
	end

	def view_all
		@batches=Batch.all
	end

	def select
		@batch=Batch.find(params[:batch][:id])
		@students=@batch.students.all
	end

	def profile
		@student=Student.find(params[:format])
	end

	def advanced_search
		@batches=Batch.all
		@course=Course.all
		@category=Category.all
	
	end
	def advanced_student_search
		@students=Student.where(first_name: params[:student][:first_name])
	end

	def elective
		@batch=Batch.find(params[:format])
	end

	def email
		@student=Student.find(params[:format])
	end
	
	def profile_pdf
	
   		@student = Student.find(params[:format])
   		@address = @student.address_line1 + ' ' + @student.address_line2
    	@immediate_contact = Guardian.find(@student.immediate_contact) \

	    respond_to do |format|
	      format.pdf { render :layout => false }
	    end
	end

	private
	def student_params
	    params.require(:student).permit(:admission_no,:class_roll_no,:admission_date,:first_name,
	    :middle_name, :last_name,:batch_id,:date_of_birth,:gender,:blood_group,:birth_place, 
	    :nationality_id ,:language,:category_id,:religion,:address_line1,:address_line2,:city,
	    :state,:pin_code,:country_id,:phone1,:phone2,:email,:immediate_contact)
	end

	def previous_data_params
		 params.require(:student_previous_data).permit(:student_id,:institution,:year,:course,:total_mark)
	end

	def params_subject
		params.require(:student_previous_subject_mark).permit(:student_id,:subject,:mark)
	end
end
