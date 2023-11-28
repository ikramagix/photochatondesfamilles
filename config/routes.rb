Rails.application.routes.draw do
  namespace :admin do
      resources :carts
      resources :cart_items
      resources :items
      resources :orders
      resources :order_items
      resources :users

      root to: "carts#index"
    end
  resources :order_items
  resources :cart_items
  resources :carts
  resources :items
  resources :orders
  devise_for :users

  root "items#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
