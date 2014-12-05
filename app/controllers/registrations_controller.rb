class RegistrationsController < Devise::RegistrationsController
layout false

  private

  def sign_up_params
    params.require(:user).permit!
  end

  def account_update_params
    params.require(:user).permit!
  end
end
