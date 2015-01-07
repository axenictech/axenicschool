# Home Controller
class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    redirect_to dashboard_home_index_path if current_user
  end

  def dashboard
    @student = current_user.student
  end
end
