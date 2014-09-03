class GuardiansController < ApplicationController

	def create
      		
	 	@student = Student.find(params[:student_id])
	 	@guardian = @student.guardians.create(guardian_params)
	 	if(@guardian.save)
			redirect_to students_admission2_1_path(@student)
		else
			render :template => 'students/admission2'
		end
    end

    def addguardian
    	@student = Student.find(params[:student_id])
    end

    def addguardian_create
    	@student = Student.find(params[:format])
	 	@guard = @student.guardians.create(guardian_params)
	 	if(@guard.save)
			redirect_to students_dispguardian_path(@student)
		else
			render :template => 'students/addguardian'
		end
    end

    def destroy
    	@guard = Guardian.find(params[:id])
    	@guard.destroy
    	redirect_to students_dispguardian_path(@guard.student)
    end
    	
   def edit
      @student=Student.find(params[:student_id])
   		@guard = @student.guardians.find(params[:id])
   end

   def update
   	  @student=Student.find(params[:student_id])
      @guard = @student.guardians.find(params[:id])
    	@guard.update(guardian_params)
    	redirect_to students_dispguardian_path(@guard.student)
   end

	private
	def guardian_params
		params.require(:guardian).permit(:first_name,:last_name,:relation,:dob,:email,:office_phone1,
       :office_phone2,:mobile_phone,:office_address_line1,
       :office_address_line2,:city,:country_id,:state,:occupation,:income,:education)
	end
end
