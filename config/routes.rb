Rails.application.routes.draw do
  # Route for the about page
  get 'about', to: 'about#index'

  # Route for the health check endpoint
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # Root route
  root 'recreation_complexes#index'

  # Define resources for recreation complexes and nested libraries
  resources :recreation_complexes, only: [:index, :show] do
    resources :libraries, only: [:show]
  end

  # Route for listing all libraries
  resources :libraries, only: [:index]
end
