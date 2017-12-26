class ProhibitionsController < ApplicationController
  before_action :set_user
  before_action :require_login
  before_action :set_prohibition, only: %i(update destroy)

  def index
    @prohibitions = @user.prohibitions
  end

  def create
    @user.prohibitions.create(prohibition_params)
    redirect_to prohibitions_path
  end

  def destroy
    @prohibition.destroy!
    redirect_to prohibitions_path
  end

  private

  def set_prohibition
    @prohibition = Prohibition.find(params[:id])
  end

  def prohibition_params
    params.require(:prohibition).permit(:prohibition_type, :word)
  end

  def set_user
    @user = User.where(identifier: session[:user_identifier], access_token: session[:access_token]).first
  end

  def require_login
    redirect_to root_path if @user.nil?
  end
end
