Goblog::Application.routes.draw do
  # Resources
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
