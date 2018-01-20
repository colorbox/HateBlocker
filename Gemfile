source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', github: 'rails/rails'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'devise'
gem 'execjs'
gem 'feedjira'
gem 'httpclient'
gem 'jbuilder'
gem 'oauth'
gem 'omniauth-hatena'
gem 'omniauth'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'therubyracer'
gem 'turbolinks'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', require: false
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
