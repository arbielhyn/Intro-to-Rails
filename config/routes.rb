Rails.application.routes.draw do
  root 'recreation_complexes#index' # Set the root route

  # Define resources for each controller
  resources :recreation_complexes, only: [:index]
  resources :libraries, only: [:index]
  resources :fitness_centers, only: [:index]

  # You don't need these redundant routes if you're using resources above
  # get 'fitness_centers/index'
  # get 'libraries/index'
  # get 'recreation_complexes/index'

  # Define your application routes per the Rails DSL
  # For health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end
