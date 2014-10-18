class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_user_language
  
  private
  def set_user_language
    language=GeneralSetting.first.language
    if language=='1'
            I18n.locale='en'
     end

     if language=='2'      
             I18n.locale='hi' 
     end

     if language=='3'
              I18n.locale='mr'
     end
     if language=='4'
              I18n.locale='ar'
     end
  end 

end
