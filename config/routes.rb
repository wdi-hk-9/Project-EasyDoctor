Rails.application.routes.draw do

  root "static_pages#index"

  resources :users, only: [:new, :index, :create, :destroy]

  get 'user/login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]

  #doctors and doctor sessions below
  resources :doctors, only: [:new, :index, :create, :destroy]

  get 'doctor/login', to: 'doctor_sessions#new'
  resources :doctor_sessions, only: [:new, :create, :destroy]

  delete "doctor/logout", to: "doctor_sessions#destroy"

  # appointments
  resources :appointments, only: [:new, :index, :create, :edit, :update, :destroy]

end
