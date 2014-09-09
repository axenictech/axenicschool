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
      flash[:notice] = 'Course was successfully created!'
      redirect_to courses_path
    else
      render action: 'new'
    end
  end

# displaying the course
  def show
  	@course=Course.find(params[:id])


    @batch=@course.batches.find_by_course_id(params[:id])
    #used find_by_course_id finds a particular batch using course

    @batches=@course.batches.all

  end

  def grouped_batches
    @course=Course.find(params[:id])
    @batches=@course.batches.all
    @batch_groups=@course.batch_groups.all
    @batch_group=BatchGroup.new
  end

  def create_batch_group
    @course=Course.find(params[:batch_group][:course_id])
    @batch_groups=@course.batch_groups.all
    name=params[:batch_group][:name]
    batches=params[:batches]

      @batch_group=BatchGroup.new(name: name,course_id: @course.id)
      @batch_group.save

       batches.each  do |batch|
            @group_batch=GroupBatch.new(batch_group_id:@batch_group.id,batch_id: batch)
            @group_batch.save
          end
      redirect_to courses_grouped_batches_path(@course)
  end

  def assign_all
      @course=Course.find(params[:id])
      @batches=@course.batches.all
  end

  def remove_all
      @course=Course.find(params[:id])
      @batches=@course.batches.all
  end
# deleting the course
  def destroy
    @course=Course.find(params[:id])
	  if @course.destroy
       flash[:notice] = 'Course was successfully deleted!'
      redirect_to courses_path
    else
       flash[:notice] = 'Course was unable to delete!'
      redirect_to courses_path
    end
  end

# edting the course
  def edit
  	@course=Course.find(params[:id])
  end

# updating the course
  def update
  @course=Course.find(params[:id])		
	@course.update(postparam)
    @courses=Course.all
  end
  
  private 
  def postparam
  params.require(:course).permit(:course_name,:section_name,:code,:grading_type,batches_attributes: [:name,:start_date,:end_date] )
  end

end
