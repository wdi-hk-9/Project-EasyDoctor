Rails.application.routes.draw do
  get 'doctor_sessions/new'

  get 'doctors/index'

  get 'doctors/new'

  root "users#index"
  resources :users, only: [:new, :index, :create, :destroy]

  resources :users, only: [:new, :index, :create, :destroy]

  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]

  delete "/logout", to: "sessions#destroy"
end
