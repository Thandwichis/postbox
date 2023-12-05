Rails.application.routes.draw do
  get 'home/index'
  get 'letters/new'
  get 'letters/create'
  get 'letters/show'
  get 'letters/index'
  devise_for :users
  resources :letters, only: [:new, :create, :show, :index], param: :id
   # Ensure this is :id  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
