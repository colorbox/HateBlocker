require 'oauth'
require 'json'

class EntriesController < ApplicationController
  before_action :set_user

  def index
    @entries = Category.find_by(kind: params[:category_kind]).entries.reject{|entry| @user.prohibit_entry?(entry)}
  end

  private

  def set_user
    @user = User.where(identifier: session[:user_identifier], access_token: session[:access_token]).first
  end
end
