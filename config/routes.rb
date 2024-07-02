Rails.application.routes.draw do
  get 'about/index'
  get 'recreation_complex/show'
  root 'recreation_complexes#index' # Set the root route

  # Define resources for each controller
  resources :recreation_complexes, only: [:index, :show]
  resources :libraries, only: [:index]

  get 'about', to: 'about#index'

  # Define your application routes per the Rails DSL
  # For health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end
