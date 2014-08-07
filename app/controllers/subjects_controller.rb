class SubjectsController < ApplicationController
  
  def index
  	@subjects=Subject.all
    @electivegroups=Electivegroup.all
  end

  def new
 #create object of subject class
  	@subject=Subject.new
  end

  def create
  #pass private subject_params method
  	@subject=Subject.new(subject_params)
  #save data from object
  	if @subject.save
  #redirect to object
  	   redirect_to subjects_path
    else
       render 'new'
    end
  end

  def show
  #find data from subject by pass id
  	@subject=Subject.find(params[:id])	
  end

  def edit
 #find data from subject by pass id
  	@subject=Subject.find(params[:id])	
  end

  def update
  #find data from subject by pass id
  	@subject=Subject.find(params[:id])
  #update data
  	@subject.update(subject_params)
  	redirect_to subjects_path
  end

  def destroy
 #find data from subject by pass id
  	@subject=Subject.find(params[:id])
 #destroy data from object
 	@subject.destroy
 	redirect_to @subject
  end

  private def subject_params
  #pass params throught private permit method
  	params.require(:subject).permit(:name, :code, :max_weekily_classes, :credit_hours, :no_exams)
  end
end
