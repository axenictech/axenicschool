class StudentsController < ApplicationController
	def advanced_search
		@batches=Batch.all
		@course=Course.all
		@category=Category.all
	
	end
	def advanced_student_search

		@student=Student.where({first_name: params[:student][:first_name],
			admission_no: params[:student][:admission_no]})
		end

end
