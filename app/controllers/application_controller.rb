class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  helper :avatar, :devise

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :avatar,
      :remote_avatar_url,
      :email,
      :username,
      :first_name,
      :last_name,
      :age,
      :website,
      :password,
      :password_confirmation,
      :current_password
    ]
  end
end
