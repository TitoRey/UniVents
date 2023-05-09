Rails.application.routes.draw do
  # Lam might need to explain how this works
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  # ToDo: Change the Root of the application. Decide w/ Team
  root to: 'home#index'
  
  resources :events
  resources :locations, only: [ :new, :create ]
  resources :users
  resources :event_user, only: [ :create, :destroy ] 

  patch '/events/:id/flag' => 'events#flag', as: 'flag'
  get 'dashboard' => 'users#dashboard', :as => 'dashboard'
end