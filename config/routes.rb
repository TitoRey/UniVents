Rails.application.routes.draw do
  # Lam might need to explain how this works
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  # ToDo: Change the Root of the application. Decide w/ Team
  root to: 'home#index'
  
  resources :events
  resources :locations
  resources :users, only: [ :index, :edit, :show ]
end