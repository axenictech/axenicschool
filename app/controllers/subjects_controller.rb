class SubjectsController < ApplicationController

  before_action :set_subject, only:[:edit,:update,:destroy]

  	def index
        @batches=Batch.all
    end

    def select
      @batch=Batch.find(params[:batch][:id])
      @subjects=@batch.subjects.all
      @elective_groups=@batch.elective_groups.all
    end

    def subject
      @batch=Batch.find(params[:batch_id])
      @subjects=@batch.subjects.all
      @elective_groups=@batch.elective_groups.all
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
        @elective_subjects=@elective_group.subjects.all if params[:elective_group_id] 
        @subject.save

        flash[:notice]="Subject Created Successfully"
        flash[:notice2]="Elective Subject Created Successfully" if params[:elective_group_id] 
  	end

    def edit  

    end

    def update
        @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
          
           @elective_subjects=@elective_group.subjects.all if params[:elective_group_id] 
      @subject.update(subject_params)
       flash[:notice]="Subject updated Successfully"
         flash[:notice2]="Elective Subject updated Successfully" if params[:elective_group_id] 
    end

    def destroy
       @subjects=@batch.subjects.all
          @elective_groups=@batch.elective_groups.all
         
           @elective_subjects=@elective_group.subjects.all if params[:elective_group_id] 
      @subject.destroy
       flash[:notice]="Subject deleted Successfully"
         flash[:notice2]="Elective Subject deleted Successfully" if params[:elective_group_id] 
    end

  	private
    def set_subject
      if params[:elective_group_id]
      @batch=Batch.find(params[:batch_id]) 
      @elective_group=ElectiveGroup.find(params[:elective_group_id]) 
      @subject=@elective_group.subjects.find(params[:id])
      else
      @batch=Batch.find(params[:batch_id]) 
      @subject=@batch.subjects.find(params[:id])
      end
    end

	  def subject_params
	  	params.require(:subject).permit(:name, :code, :max_weekly_classes, :no_exams)
	  end
end
