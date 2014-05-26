Goblog::Application.routes.draw do
  # Root path
  root 'posts#index'

  get 'register', to: 'users#new'
  get 'logout',   to: 'sessions#destroy'

  # Resources
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts
  resources :comments
end
