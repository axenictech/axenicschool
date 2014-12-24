# GeneralSetting Controller
class GeneralSettingsController < ApplicationController
  def new
    @general_setting = current_user.general_setting
    authorize! :read, @general_setting
  end

  def update
    @general_setting = GeneralSetting.where(id: params[:id]).take
    if @general_setting.update(general_setting_params)
      flash[:notice] = t('setting_update')
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
