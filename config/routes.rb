Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :site, only: [:show]

  resources :clubs
  resources :users
  resources :kits
  resources :items

  resources :conversations do
    resources :messages
  end

  root 'site#index'
end
