module Admin
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end
  end
end
