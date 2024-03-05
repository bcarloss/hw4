Rails.application.routes.draw do
  # Define the root path of the application
  root 'places#index'

  # Nested routes for places and their entries
  resources :places do
    resources :entries, only: [:create, :new, :show] # Entries are nested within places
  end

  # Routes for user sessions
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] # If you have other user actions, include them here

  # Custom route for login, logout, and signup
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
end
