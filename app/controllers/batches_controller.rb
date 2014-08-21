class BatchesController < ApplicationController
  
  	def index

  	end

	def new
		@course=Course.find(params[:course_id])
	end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.create(postparam)
  	redirect_to courses_path
  end

private 
def postparam

	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 