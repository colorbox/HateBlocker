class ProhibitionsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :set_prohibition, only: %i(update destroy)

  def index
    @prohibitions = @user.prohibitions.sort_by(&:prohibition_type)
  end

  def create
    @user.prohibitions.create(prohibition_params)
    redirect_to prohibitions_path
  end

  def destroy
    @prohibition.destroy!
    redirect_to prohibitions_path
  end

  def update
    @prohibition.update(activated: !@prohibition.activated)
    redirect_to prohibitions_path
  end

  private

  def set_prohibition
    @prohibition = Prohibition.find(params[:id])
  end

  def prohibition_params
    params.require(:prohibition).permit(:prohibition_type, :word)
  end
end
