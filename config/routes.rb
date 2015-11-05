Rails.application.routes.draw do
  root "static_pages#index"

  get 'signup', to: 'users#new'

  get '/users/appointments', to: 'appointments#index'
  resources :users, only: [:index, :create] do
    resources :appointments, only: [:new, :create]
  end

  get 'doctors/appointments', to: "appointments#doctor_index"
  put 'doctors/appointments/:id', to: "appointments#update", as: "doctors_appointment"

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

end
