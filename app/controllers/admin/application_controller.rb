module Admin
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :reject_unless_admin
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout 'admin/layouts/application'

    protect_from_forgery with: :exception
    helper :avatar, :devise, :admin

    protected

    def reject_unless_admin
      unless current_user.admin?
        raise ActionController::RoutingError.new('404: Not Found')
      end
    end

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
end
