Rails.application.routes.draw do
  root 'static_pages#index'

  resources :users, only: [:new, :index, :create, :destroy]

  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]

  delete "/logout", to: "sessions#destroy"
end
