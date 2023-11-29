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

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end

  #Adding to cart and devise
  devise_for :users
  post '/add_to_cart/:id', to: 'carts#add_to_cart', as: 'add_to_cart'
  root "items#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    post 'add_to_cart', on: :member
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/cart', to: 'carts#show', as: 'shopping_cart'
  # Defines the root path route ("/")
  # root "posts#index"
end
