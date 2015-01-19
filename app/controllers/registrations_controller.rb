class RegistrationsController < Devise::RegistrationsController
  def update
    update_params = account_update_params
    # required for settings form to submit when password is left blank
    if update_params[:password].blank?
      [:password,:password_confirmation,:current_password].collect do
        |p| update_params.delete(p)
      end
    end

    if update_params[:password].present? && update_params[:current_password].blank?
      [:current_password].collect{ |p| update_params.delete(p) }
    end

    self.resource = resource_class.to_adapter.get!(
      send(:"current_#{resource_name}").to_key
    )

    if resource.respond_to?(:unconfirmed_email)
      prev_unconfirmed_email = resource.unconfirmed_email
    end

    if update_resource(resource, update_params)
      yield resource if block_given?
      
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end

      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_attributes(params)
  end

  def after_sign_up_path_for(user)
    user_path(user)
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
