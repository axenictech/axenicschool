class ElectivegroupsController < ApplicationController

	def new
		@electivegroup=Electivegroup.new
	end

	def create
		@electivegroup=Electivegroup.new(electivegroup_params)
		if @electivegroup.save
			redirect_to subjects_path
		else
			render 'new'
		end
	end

	def edit
		@electivegroup=Electivegroup.find(params[:id])
	end

	def update
 #find data from subject by pass id
	  	@electivegroup=Electivegroup.find(params[:id])
 #update data
	  	@electivegroup.update(electivegroup_params)
	  	redirect_to subjects_path
	end

	def destroy
		@electivegroup=Electivegroup.find(params[:id])
		@electivegroup.destroy
		redirect_to subjects_path
	end

	private def electivegroup_params
		params.require(:electivegroup).permit(:name)
	end
end
