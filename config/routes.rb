Rails.application.routes.draw do
  # Define the root path of the application
  root 'places#index'

  # Nested routes for places and their entries
  resources :places, only: [:index, :show, :new, :create] do
    resources :entries, only: [:create, :new, :show]
  end

  # Resourceful routes for user session (although new and create are enough for sessions)
  resources :sessions, only: [:new, :create, :destroy]

  # Resourceful routes for users
  resources :users, only: [:new, :create]

  # Custom routes for login, logout, and signup
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'signup', to: 'users#new', as: :signup
  post 'signup', to: 'users#create'
end

