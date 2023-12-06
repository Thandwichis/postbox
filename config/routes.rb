Rails.application.routes.draw do
  get 'home/index'
  get 'letters/new'
  get 'letters/create'
  get 'letters/show'
  get 'letters/index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :letters
  resources :users, only: [:new, :create, :edit, :update, :show]
  root to: "home#index"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
