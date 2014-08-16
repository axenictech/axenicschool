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
      params.require(:general_setting).permit(:institution_name, :institution_address, :institution_phone_no, :student_attendance_type, :language, :time_zone, :country, :network_state)
    end
end
