Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # 7 typical routes:
  # Index - Shows all the records
  # get "/products", to: "products#index"

  # # New - Renders a form for creating a new record
  # get "/products/new", to: "products#new"

  # # Create - Processes the new form submission, handling errors and creating the record
  # post "/products", to: "products#create"

  # # Show - Renders a specific record for viewing
  # get "/products/:id", to: "products#show"

  # # Edit - Renders a form for updating a specific record
  # get "/products/:id/edit", to: "products#edit"

  # # Update - Handles the edit form submission, handling errors and updating the record
  # patch "/products/:id", to: "products#update"
  # put "/products/:id", to: "products#update"

  # # Destroy - Handles deleting a specific record
  # delete "/products/:id", to: "products#destroy"

  # resources :products
  resources :products do
    resources :subscribers, only: [ :create ]
  end


  # Controller namespaces and routing
  # namespace :admin do
  #   resources :products
  # end
  # Admin controller without prefix /admin
  # scope module: "admin" do
  #   resources :products
  # end


  # bundle exec rubocop config/routes.rb --autocorrect
end
