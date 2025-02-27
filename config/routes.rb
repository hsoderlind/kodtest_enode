Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :points
  resources :cart_items
  resources :customers
  resources :campaigns
  resources :categories
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/carts", to: "carts#create"
  post "/orders/:id/invoice", to: "orders#invoice"
  get "/invoices", to: "invoices#index"
  get "/invoices/:id", to: "invoices#show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
