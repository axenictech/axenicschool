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

	private
	def student_params
	    params.require(:student).permit(:admission_no,:class_roll_no,:admission_date,:first_name,
	    :middle_name, :last_name,:batch_id,:date_of_birth,:gender,:blood_group,:birth_place, 
	    :nationality_id ,:language,:category_id,:religion,:address_line1,:address_line2,:city,
	    :state,:pin_code,:country_id,:phone1,:phone2,:email)
	end

	def param
		params.require(:guardian).permit(:first_name,:last_name,:relation,:dob,:email,:office_phone1,
	   :office_phone2,:mobile_phone,:office_address_line1,
	   :office_address_line2,:city,:country_id,:state,:occupation,:income,:education)
	end
end
