require 'oauth'
require 'json'

class SessionsController < ApplicationController

  def index
    if session[:last_shown_category]
      category = Category.find_by_kind(session[:last_shown_category])
      redirect_to category_entries_path(category.kind) if user_signed_in?
    else
      redirect_to category_entries_path(Category.first.kind) if user_signed_in?
    end
  end

  def create
    @consumer = OAuth::Consumer.new(
      ENV['HATENA_CONSUMER_KEY'],
      ENV['HATENA_CONSUMER_SECRET'],
      site: '',
      request_token_path: 'https://www.hatena.com/oauth/initiate',
      access_token_path: 'https://www.hatena.com/oauth/token',
      authorize_path: 'https://www.hatena.ne.jp/oauth/authorize')

    request_token = @consumer.get_request_token({oauth_callback: ENV['HATENA_CALLBACK_URL']}, scope: 'read_public')

    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret

    redirect_to request_token.authorize_url
  end
end
