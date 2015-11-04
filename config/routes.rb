Rails.application.routes.draw do
  root "static_pages#index"

  get 'user/dashboard', to: 'users#dashboard'

  get 'signup', to: 'users#new'
  resources :users, only: [:create, :show]

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

    resources :appointments, only: [:create]
end
