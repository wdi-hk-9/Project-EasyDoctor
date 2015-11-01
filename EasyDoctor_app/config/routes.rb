Rails.application.routes.draw do
root "users#index"
resources :users, only: [:new, :index, :create, :destroy]

get 'login', to: 'sessions#new'
resources :sessions, only: [:new, :create, :destroy]

end
