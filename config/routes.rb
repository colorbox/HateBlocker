Rails.application.routes.draw do
  resources :category, param: :name,  only: %i() do
    resources :entries, only: :index
  end
end
