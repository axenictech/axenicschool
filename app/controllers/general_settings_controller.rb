class GeneralSettingsController < ApplicationController
	def new
    @general_setting=GeneralSetting.new
	end
	

	def create
	@general_setting =GeneralSetting.new(general_setting_params)
 
		if @general_setting.save
		redirect_to general_setting_path(@general_setting)
		else
		render 'new'
		end
    end

   def show

  	@general_setting = GeneralSetting.find(params[:id])
  end
 
    private
    def general_setting_params
      params.require(:general_setting).permit(:InstitutionName, :InstitutionAddress, :InstitutionPhoneNo, :StudentAttendanceType, :Finance_start_year_date, :Finance_end_year_date,:Language, :TimeZone, :image, :Country, :NetworkState)
    end
end
