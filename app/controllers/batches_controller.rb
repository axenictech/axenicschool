class BatchesController < ApplicationController
  
  	def index

  	end

	def new
		@course=Course.find(params[:course_id])
	end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.create(postparam)
<<<<<<< HEAD
  	redirect_to batch_path(@batch)
  end

  def show
  	@batch=Batch.find(params[:id])
    params[:course_id]=@batch.course_id
    @course=Course.find(params[:course_id])
=======
  	redirect_to @course
  end

  def show
  	@batch=Batch.all
>>>>>>> bb02eeda859dd434e6da22357404ffc2d94ad70e
  end

private def postparam

	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 