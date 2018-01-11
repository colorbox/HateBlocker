class CategoriesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end
end
