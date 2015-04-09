class RegistrationsController < Devise::RegistrationsController
  def update
    update_params = account_update_params
    # required for settings form to submit when password is left blank
    if update_params[:current_password].blank?
      [:password, :password_confirmation, :current_password, :email].map do |p|
        update_params.delete(p)
      end
    end

    if update_registration(current_user, update_params)
      set_flash_message :notice, :updated if is_flashing_format?

      sign_in resource_name, current_user, bypass: true
      respond_with current_user, location: edit_user_registration_path
    else
      clean_up_passwords current_user
      respond_with current_user
    end
  end

  protected

  def update_registration(resource, params)
    if params[:current_password].present?
      update_resource(resource, params)
    else
      resource.update_without_password(params)
    end
  end

  private

  def register_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def account_update_params
    params.require(:user).permit(
      :avatar,
      :username,
      :age,
      :website,
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :remote_avatar_url,
      :remove_avatar
    )
  end
end
