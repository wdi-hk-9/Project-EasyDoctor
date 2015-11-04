Rails.application.routes.draw do
  root "static_pages#index"

  get 'user/dashboard', to: 'users#dashboard'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :create, :show] do
    resources :appointments, only: [:new, :create]
  end

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

end
