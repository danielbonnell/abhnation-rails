module Admin
  class UsersController < Admin::ApplicationController
    def index
      @users = User.all.order("username ASC").page params[:page]
    end

    # def show
    #   @user = User.find(params[:id])
    # end
    #
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      if @user.update_attributes(account_update_params)
        redirect_to admin_users_path, notice: "Success"
      else
        redirect_to edit_admin_user_path(@user), notice: "Failed"
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user != current_user && @user.destroy
        redirect_to admin_users_path, notice: "Success"
      else
        redirect_to admin_users_path, notice: "Failed"
      end
    end

    private

    def account_update_params
      params.require(:user).permit(
        :avatar,
        :username,
        :age,
        :website,
        :first_name,
        :last_name,
        :email,
        :remote_avatar_url,
        :remove_avatar
      )
    end
  end
end
