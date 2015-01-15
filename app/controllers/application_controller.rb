class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  helper :avatar, :navbar

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :avatar,
      :avatar_link,
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
