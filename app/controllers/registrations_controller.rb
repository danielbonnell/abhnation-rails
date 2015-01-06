class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    user_path(user)
  end

  private

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :age, :website, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
