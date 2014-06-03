Goblog::Application.routes.draw do
  # Root path
  root 'posts#index'

  get 'register', to: 'users#new'
  get 'logout',   to: 'sessions#destroy'
  get 'users/edit', to: 'users#edit'
  # Resources
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts
  resources :comments, only: [:create]
end
