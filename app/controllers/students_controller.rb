class StudentsController < ApplicationController

	def search_ajax
		@students=Student.where(:first_name=> params[:student][:first_name])
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
		# admission_no: params[:student][:admission_no]})	
		# ,course_id: params[:student][:id][:course_id]
	end
end
