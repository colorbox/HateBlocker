require 'oauth'
require 'json'

class EntriesController < ApplicationController
  before_action :set_user
  before_action :login_or_signup
  
  def index
    @entries = Category.find_by(kind: params[:category_name]).entries
  end

  private

  def set_user
    @user = User.where(identifier: session[:user_identifier], access_token: session[:access_token]).first
  end

  def login_or_signup
    return if @user.present?

    @consumer = OAuth::Consumer.new(
      ENV['HATENA_CONSUMER_KEY'],
      ENV['HATENA_CONSUMER_SECRET'],
      site: '',
      request_token_path: 'https://www.hatena.com/oauth/initiate',
      access_token_path: 'https://www.hatena.com/oauth/token',
      authorize_path: 'https://www.hatena.ne.jp/oauth/authorize')

    request_token = OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_token_secret])
    access_token = request_token.get_access_token({}, oauth_verifier: params[:oauth_verifier])

    session[:request_token] = nil
    session[:request_token_secret] = nil
    session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret

    response = access_token.request(:get, 'http://n.hatena.com/applications/my.json')
    data = if response
             JSON.parse(response.body)
           else
             ''
           end

    @user = User.where(identifier: data['url_name']).first_or_initialize
    @user.access_token = access_token.token
    @user.save

    session[:user_identifier] = data['url_name']
  end
end
