Rails.application.routes.draw do

  root 'sessions#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :categories, param: :kind,  only: %i(index) do
    resources :entries, only: :index
  end

  resources :sessions, only: %i(create index)
  resources :prohibitions, only: %i(index create destroy)
  resources :users, only: %i(destroy)
end
