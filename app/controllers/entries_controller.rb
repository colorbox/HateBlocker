require 'oauth'
require 'json'

class EntriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user

  def index
    @categories = Category.all
    if params[:category_kind]
      @selected_category = Category.find_by(kind: params[:category_kind])
      session[:last_shown_category] = params[:category_kind]
    else
      @selected_category = Category.find_by(kind: session[:last_shown_category])
    end
    @selected_category = Category.first unless @selected_category
    @entries = @selected_category.entries.reject{|entry| @user.prohibit_entry?(entry)}
  end
end
