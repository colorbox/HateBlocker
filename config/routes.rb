Rails.application.routes.draw do

  root 'sessions#index'

  resources :categories, param: :name,  only: %i() do
    resources :entries, only: :index
  end

  resources :sessions, only: %i(create index)

  resources :prohibitions, only: %i(index create update destroy)
end
