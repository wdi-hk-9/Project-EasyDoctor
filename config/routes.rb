Rails.application.routes.draw do

  root "users#index"
  resources :users, only: [:new, :index, :create, :destroy]

  resources :users, only: [:new, :index, :create, :destroy]

  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]

  #doctors and doctor sessions below
  resources :doctors, only: [:new, :index, :create, :destroy]

  get 'doctor_login', to: 'doctor_sessions#new'
  resources :doctor_sessions, only: [:new, :create, :destroy]

  delete "/doctor_logout", to: "doctor_sessions#destroy"
end
