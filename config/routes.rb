Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "home#index" 
end