# Setting Controller
class SettingController < ApplicationController
  def index
    authorize! :read, GeneralSetting
  end

  def course_batch
    authorize! :read, GeneralSetting
  end
end
