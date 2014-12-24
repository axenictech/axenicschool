# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_current_user
  rescue_from CanCan::AccessDenied do
    redirect_to root_url, alert: 'You are not Authorized'
  end

  def set_current_user
    User.current = current_user
  end
end
