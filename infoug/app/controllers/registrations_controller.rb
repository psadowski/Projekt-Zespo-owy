class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :surname, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :surname, :password, :password_confirmation, :current_password)
  end
  
  def save_role
    params.require(:user).permit(:role)
  end
end  