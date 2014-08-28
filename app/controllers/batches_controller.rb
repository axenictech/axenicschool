class BatchesController < ApplicationController
  
  	 def index
     @courses=Course.all
    end

  def new
    @course=Course.find(params[:course_id])
  end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.create(postparam)
  	redirect_to course_path(@course)
  end
   
   def display
       @batch=Batch.find(params[:format])
       @students=@batch.students.all
   end

   def select
     @course = Course.find(params[:course][:id])
   end


   def edit
    @batch = Batch.find(params[:id])
     
   end

   def update
      @batch = Batch.find(params[:id])
  
  
         if @batch.update(postparam)
           redirect_to   course_path(@batch.course)
          else
           render 'display'
         end
     end

     def destroy
     @batch = Batch.find(params[:format])
     @batch.destroy
     redirect_to course_path(@batch.course)
  end

private 
def postparam
	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 
