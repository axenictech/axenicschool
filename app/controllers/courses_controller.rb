class CoursesController < ApplicationController
	# index method for application
  def index

    @courses=Course.all

  end

  # new method for  a new course
  def new
  	@course=Course.new
    
  end

# creating a new course
  def create
  	@course=Course.new(postparam)
  if @course.save
  	redirect_to  courses_path
  else
   render 'new'
  end
  end

# displaying the course
  def show
  	@courses=Course.all

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
	@course.update(postparam)
	redirect_to courses_path

  end



private def postparam
params.require(:course).permit(:course_name,:section_name,:code,:grading_type)
end
end
