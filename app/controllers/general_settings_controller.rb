class GeneralSettingsController < ApplicationController
  def new
    @general_setting = current_user.general_setting
    authorize! :read, @general_setting
  end

  def update
    @general_setting = GeneralSetting.find(params[:id])

    if @general_setting.update(general_setting_params)
      flash[:notice] = 'General settings updated successfully'
      redirect_to dashboard_home_index_path
    else
      render 'new'
    end
  end

  private

  def general_setting_params
    params.require(:general_setting).permit!
  end
end
