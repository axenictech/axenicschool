class GeneralSettingsController < ApplicationController
	def new
    @general_setting=GeneralSetting.first
	end
	
	def update
    @general_setting=GeneralSetting.find(params[:id])

		if @general_setting.update(general_setting_params)
      flash[:msg]="General settings updated successfully"
		redirect_to new_general_setting_path
		else
		render 'new'
		end
    end
 
    private
    def general_setting_params
      params.require(:general_setting).permit(:InstitutionName, :InstitutionAddress, 
      	:InstitutionPhoneNo, :StudentAttendanceType, :Finance_start_year_date, 
      	:Finance_end_year_date,:Language, :TimeZone, :image, :Country, :NetworkState)
    end
end
