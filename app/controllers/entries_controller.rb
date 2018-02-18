require 'oauth'
require 'json'

class EntriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user

  def index
    @categories = Category.all
    category = Category.find_by(kind: params[:category_kind])
    @entries = category.entries.reject{|entry| @user.prohibit_entry?(entry)} if category
  end
end
