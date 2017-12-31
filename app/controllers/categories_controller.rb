class CategoriesController < ApplicationController
  before_action :set_user
  before_action :login_or_signup

  def index
    @categories = Category.all
  end
end
