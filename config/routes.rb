Rails.application.routes.draw do

  root "static_pages#index"

  get    'login',  to: 'sessions#new'
  get    'signup', to: 'users#new'
  delete 'logout', to: 'sessions#destroy'
  resources :users,    only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
