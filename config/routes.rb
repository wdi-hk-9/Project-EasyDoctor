Rails.application.routes.draw do
  root "static_pages#index"

  get '/users/appointments', to: 'appointments#index'
  resources :users, only: [:index, :create] do
    resources :appointments, only: [:new, :create]
  end

  get 'doctors/appointments', to: "appointments#doctor_index"
  put 'doctors/appointments/:id/confirm', to: "appointments#confirm", as: "doctors_appointment_confirm"
  put 'doctors/appointments/:id/reject',  to: "appointments#reject",  as: "doctors_appointment_reject"

  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

end
