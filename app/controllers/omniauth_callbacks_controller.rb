class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def hatena
    @user = User.from_omniauth(request.env["omniauth.auth"])

    sign_in @user

    redirect_to category_entries_path(Category.first)
  end

  def failure
    redirect_to root_path
  end
end
