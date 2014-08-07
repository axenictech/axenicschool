class BatchesController < ApplicationController
  
  	def index

  	end
	def new
		@batch=Batch.new
	end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.create(postparam)
  	redirect_to courses_path
  end

  def show
  	@batch=Batch.all
  end

private def postparam

	params.require(:batch).permit(:name,:start_date,:end_date)

end


 # @article = Article.find(params[:article_id])
 #    @comment = @article.comments.create(comment_params)
 #    redirect_to article_path(@article)