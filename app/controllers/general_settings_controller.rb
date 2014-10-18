class GeneralSettingsController < ApplicationController
	def new
    @general_setting=GeneralSetting.first
	end
	
	def update
    @general_setting=GeneralSetting.find(params[:id])

		if @general_setting.update(general_setting_params)
            flash[:notice]="General settings updated successfully"
		    redirect_to new_general_setting_path
		else
		render 'new'
		end
    end
 
    private
    def general_setting_params
      params.require(:general_setting).permit(:school_or_college_name,:school_or_college_address,:school_or_college_phone_no,
        :student_attendance_type,:finance_start_year_date,:finance_end_year_date,:language,:time_zone,:country,
        :include_grading_system,:addmission_number_auto_increament,:employee_number_auto_increament,:enable_news_comment_moderation,:image)
    end
end
