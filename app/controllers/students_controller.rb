class StudentsController < ApplicationController

<<<<<<< HEAD
	def admission2
		@guardian=Guardian.new
	end

	def adm_create 
		@guardian=Guardian.new(param)
		@guardian.save
		redirect_to students_admission3_path(@guardian)
	end

	def admission3
		@guardian=Guardian.find(params[:format])
		@guardians=Guardian.all
		
	end
	 private
	 def param
		params.require(:guardian).permit(:first_name,:last_name,:relation,:dob,:email,:office_phone1,
       :office_phone2,:mobile_phone,:office_address_line1,
       :office_address_line2,:city,:country_id,:state,:occupation,:income,:education)
	 end
=======
def search_ajax
	@students=Student.where(:first_name=> params[:student][:first_name])

end

>>>>>>> 24151b83b585f1f92874f6690f67dd86724c68f5
end
