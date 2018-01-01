class UsersController < ApplicationController
  before_action :set_user

  def destroy
    @user.destroy!

    redirect_to root_path
  end
end
