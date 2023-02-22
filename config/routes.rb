Rails.application.routes.draw do
  resources :controllers
  resources :users
  get '/dashboard' => "users#dashboard", as: 'dashboard'
  get '/signin' => "sessions#new", as: 'signin'
  post '/login' => "sessions#create", as: "login"
  get '/logout' => "sessions#destroy", as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"
end
