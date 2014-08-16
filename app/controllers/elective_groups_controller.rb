class ElectiveGroupsController < ApplicationController

   before_action :set_elective_group, only:[:edit,:update,:destroy]

	  def new
	    @batch = Batch.find params[:batch_id]
      @elective_group=@batch.elective_groups.build
    end
  	
  	def create
  		@batch=Batch.find(params[:batch_id])
  	    @elective_group=@batch.elective_groups.new(elective_group_params)
       if @elective_group.save
         redirect_to batch_subjects_path, notice: "ElectiveGroup was successfully created"
      else
         render 'new'
      end
  	end

    def edit  
    end

    def update
      if @elective_group.update(elective_group_params)
         redirect_to batch_subjects_path, notice: "ElectiveGroup was successfully updated"
      else
        render 'new'
      end
    end

    def destroy
     if @elective_group.destroy
        redirect_to batch_subjects_path, notice: "ElectiveGroup was successfully deleted"
      else
        redirect_to batch_subjects_path, notice: "ElectiveGroup was uanable to delete"
      end
    end

  	private
     def set_elective_group
      @batch=Batch.find(params[:batch_id])
      @elective_group=@batch.elective_groups.find(params[:id])
    end
 
	  def elective_group_params
	  	params.require(:elective_group).permit(:name)
	  end
end
