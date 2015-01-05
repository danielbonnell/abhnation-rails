class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  protected

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up) << :username
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update) << :username
  end
end
