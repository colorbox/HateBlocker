require 'oauth'
require 'json'

class EntriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user

  def index
    @categories = Category.all
    if params[:category_kind]
      category = Category.find_by(kind: params[:category_kind])
      session[:last_shown_category] = params[:category_kind]
    else
      category = Category.find_by(kind: session[:last_shown_category])
    end
    category = Category.first unless category
    @entries = category.entries.reject{|entry| @user.prohibit_entry?(entry)}
  end
end
