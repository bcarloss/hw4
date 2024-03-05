Rails.application.routes.draw.do
  get "/", to: "places#index"
  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  # Session routes for custom login/logout actions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # User signup routes
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
end

