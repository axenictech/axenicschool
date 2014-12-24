class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :set_current_user
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_url, alert: 'You are not Authorized'

  end

  def set_current_user
    User.current = current_user
  end
end
