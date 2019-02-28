Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, except: [:show, :index]
  end
  resources :users

  get 'dashboard', to: 'home#dashboard'
end
