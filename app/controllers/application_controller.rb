class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_user
    @user = current_user
  end
end
