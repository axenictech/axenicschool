class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_user_language
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_filter :set_current_user
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: 'You are not Authorized'
  end


  def set_current_user
    User.current = current_user
  end
  
  private

  def set_user_language
  end

  # def record_not_found
  #   render '/public/404.html', layout: false
  # end
end
