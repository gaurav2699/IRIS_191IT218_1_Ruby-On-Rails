class RegistrationsController < Devise::RegistrationsController

  private

  #Allows trusted parameters for signing up for an account
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #Allows trusted parameters for updating an account
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:current_password)
  end
end
