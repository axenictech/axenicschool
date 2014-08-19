class SubjectsController < ApplicationController

  before_action :set_subject, only:[:edit,:update,:destroy]
  
  	def index
        @batches=Batch.all
    end

    def select
    end

  	def new

	    @batch = Batch.find(params[:batch_id])
      @subject=@batch.subjects.build

      @elective_group=ElectiveGroup.find(params[:elective_group_id]) if params[:elective_group_id]
      @subject=@elective_group.subjects.build if params[:elective_group_id]
 
  	end
  	
  	def create
  		  @batch=Batch.find(params[:batch_id])
        @subject=@batch.subjects.new(subject_params)

        @elective_group=ElectiveGroup.find params[:elective_group_id] if params[:elective_group_id]
        @subject=@elective_group.subjects.new(subject_params) if params[:elective_group_id]
        if @subject.save
         redirect_to batch_subjects_path, notice: "Subject was successfully created"
        else
         render 'new'
        end
  	end

    def show
          @batch=Batch.find(params[:batch][:id])
          @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
    end

    def edit  
    end

    def update
      if @subject.update(subject_params)
         redirect_to batch_subjects_path, notice: "Subject was successfully updated"
      else
        render 'new'
      end
    end

    def destroy
     if @subject.destroy
        redirect_to batch_subjects_path, notice: "Subject was successfully deleted"
      else
        redirect_to batch_subjects_path, notice: "Subject was uanable to delete"
      end
    end

  	private
    def set_subject
      @batch=Batch.find(params[:batch_id])
      @subject=@batch.subjects.find(params[:id])
    end

	  def subject_params
	  	params.require(:subject).permit(:name, :code, :max_weekly_classes, :no_exams)
	  end
end
