class SubjectsController < ApplicationController

  before_action :set_subject, only:[:edit,:update,:destroy]
  respond_to :html, :js

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
        @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
        @subject=@batch.subjects.new(subject_params)

        @elective_group=ElectiveGroup.find params[:elective_group_id] if params[:elective_group_id]
        @subject=@elective_group.subjects.new(subject_params) if params[:elective_group_id]
        
        @subject.save
  	end

    def show
          @batch=Batch.find(params[:batch][:id])
          @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
    end

    def edit  
    end

    def update
        @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
      @subject.update(subject_params)
    end

    def destroy
       @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
      @subject.destroy
    end

  	private
    def set_subject
      @batch=Batch.find(params[:batch_id])
      @subject=@batch.subjects.find(params[:id])
      @subject=@elective_group.subjects.find(params[:elective_group_id]) if params[:elective_group_id]
    end

	  def subject_params
	  	params.require(:subject).permit(:name, :code, :max_weekly_classes, :no_exams)
	  end
end
