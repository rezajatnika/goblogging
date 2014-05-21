Goblog::Application.routes.draw do

  get 'register', to: 'users#new'
  get 'logout',   to: 'sessions#destroy'

  # Resources
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
