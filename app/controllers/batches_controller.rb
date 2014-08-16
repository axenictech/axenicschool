class BatchesController < ApplicationController
  
  	def index

  	end

	def new
		@course=Course.find(params[:course_id])
	end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.create(postparam)
  	redirect_to batch_path(@batch)
  end

  def show
  	@batch=Batch.find(params[:id])
    params[:course_id]=@batch.course_id
    @course=Course.find(params[:course_id])
  end

private def postparam

	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 