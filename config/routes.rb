Rails.application.routes.draw do
  # What is this for again? 
  get 'users/index'
  
  get 'events', to: 'events#index'
  # Lam might need to explain how this works
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  # ToDo: Change the Root of the application. Decide w/ Team
  root to: "home#index" 
  
  resources :events
end