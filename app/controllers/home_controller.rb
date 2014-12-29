# Home Controller
class HomeController < ApplicationController
  def dashboard
    @student = current_user.student
  end
end
