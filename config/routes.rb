Rails.application.routes.draw do

  root to: "home#index"
  get 'home/index'
  get 'letters/new'
  get 'letters/create'
  get 'letters/show'
  get 'letters/index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :letters
  resources :users, only: [:new, :create, :edit, :update, :show]
  # resources :letters do
  #   member do
  #     put :save_to_shelf
  #   end
  # end
  
  get '/letters/:id/open', to: 'letters#open_letter', as: :open_letter

  # Defines the root path route ("/")
  # root "articles#index"
end
