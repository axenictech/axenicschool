class BatchesController < ApplicationController
  
  	 def index
     @courses=Course.all
    end

  def new
    @course=Course.find(params[:course_id])
    @batch=@course.batches.build
  end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.new(postparam)
      if @batch.save
       flash[:notice] = 'Batch successfully created!'
  	   redirect_to course_path(@course)
    else
      render 'new'
    end
  end
   
   def display
       @batch=Batch.find(params[:id])
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
            flash[:notice] = 'Batch updated successfully!'
           redirect_to   course_path(@batch.course)
          else
           render 'edit'
         end
     end

     def destroy
     @batch = Batch.find(params[:id])
     if @batch.destroy
      flash[:notice] = 'Batch deleted successfully!'
       redirect_to course_path(@batch.course)
    else
       flash[:notice] = 'Batch unable to delete!'
       redirect_to course_path(@batch.course)
    end
  end

private 
def postparam
	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 
