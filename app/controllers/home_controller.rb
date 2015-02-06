# Home Controller
class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    redirect_to dashboard_home_index_path if current_user
  end

  def dashboard
    @student = current_user.student
    @acts ||= UserActivity.order(created_at: :desc) if current_user.id == 1
  end

  def user_activity
    @activity = UserActivity.shod(params[:id])
    @model ||= @activity.activity_model
  end
end
