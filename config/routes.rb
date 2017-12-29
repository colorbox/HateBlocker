Rails.application.routes.draw do

  root 'sessions#index'

  resources :categories, param: :kind,  only: %i(index) do
    resources :entries, only: :index
  end

  resources :sessions, only: %i(create index)

  resources :prohibitions, only: %i(index create destroy)
end
