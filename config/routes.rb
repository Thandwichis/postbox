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
  resources :stamps, only: [:index] do
    post 'buy/:id', on: :member, to: 'stamps#buy', as: 'buy_stamp'
  end
  
  resources :user_stamps, only: [:index, :create, :destroy]  
  # resources :letters do
  #   member do
  #     put :save_to_shelf
  #   end
  # end
  # DELETE THIS BUTTON/Function
  resources :users do
    post 'add_cents', on: :collection
  end
  
  get '/letters/:id/open', to: 'letters#open_letter', as: :open_letter
  get '/service_worker.js', to: 'home#service_worker'

  # Defines the root path route ("/")
  # root "articles#index"
end
