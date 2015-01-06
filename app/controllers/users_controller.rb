class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  protected

  @acceptable_params = [
    :email,
    :username,
    :first_name,
    :last_name,
    :age,
    :website
  ]

  def sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << @acceptable_params
  end

  def account_update_params
    devise_parameter_sanitizer.for(:account_update) << @acceptable_params
  end
end
