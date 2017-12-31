require 'oauth'
require 'json'

class EntriesController < ApplicationController
  before_action :set_user
  before_action :login_or_signup

  def index
    @entries = Category.find_by(kind: params[:category_kind]).entries.reject{|entry| @user.prohibit_entry?(entry)}
  end
end
