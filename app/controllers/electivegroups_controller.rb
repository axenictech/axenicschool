class ElectivegroupsController < ApplicationController

	def new
		@electivegroup=Electivegroup.new
		@electivegroups=Electivegroup.all
	end

	def create
		@electivegroup=Electivegroup.new(electivegroup_params)
		@electivegroup.save
		redirect_to @electivegroup
	end

	private def electivegroup_params
		params.require(:electivegroup).permit(:name)
	end
end
