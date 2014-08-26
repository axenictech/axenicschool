class CoursesController < ApplicationController
	# index method for application
  def index

    @courses=Course.all

  end

  # new method for  a new course
  def new
  	@course=Course.new
    @batch=Batch.new
    @course.batches.build
    
  end
  def create
    @course=Course.new(postparam)
      

     if  @course.save 
      
      flash[:success] = "Welcome to the Sample App!"
      redirect_to courses_path
    
       else
    render action: 'new'
        
    
       end
    # end
  end

# displaying the course
  def show
  	@course=Course.find(params[:id])


    @batch=@course.batches.find_by_course_id(params[:id])
    #used find_by_course_id finds a particular batch using course

    @batches=@course.batches.all

  end

# deleting the course
  def destroy
    @course=Course.find(params[:id])
	  @course.destroy

	  redirect_to courses_path
  end

# edting the course
  def edit
  	@course=Course.find(params[:id])
  end

# updating the course
  def update
  @course=Course.find(params[:id])		
	@course.update(postp)
	redirect_to courses_path

  end




private 
def postparam
params.require(:course).permit(:course_name,:section_name,:code,:grading_type,batches_attributes: [:name,:start_date,:end_date] )
end
private
def postp
params.require(:course).permit(:course_name,:section_name,:code,:grading_type)

end
end
