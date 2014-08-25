class ElectiveGroupsController < ApplicationController

   before_action :set_elective_group, only:[:edit,:update,:destroy]

	  def new
	    @batch = Batch.find params[:batch_id]
      @elective_group=@batch.elective_groups.build
    end
  	
  	def create
  		@batch=Batch.find(params[:batch_id])
        @subjects=@batch.subjects.all
        @elective_groups=@batch.elective_groups.all
  	    @elective_group=@batch.elective_groups.new(elective_group_params)
        @elective_group.save
  	end

    def edit  
    end

    def update
      @subjects=@batch.subjects.all
        @elective_groups=@batch.elective_groups.all
    @elective_group.update(elective_group_params)
    end

    def destroy
      @subjects=@batch.subjects.all
        @elective_groups=@batch.elective_groups.all
     @elective_group.destroy
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
