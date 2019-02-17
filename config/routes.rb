Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resources :posts
  resources :users

  get 'dashboard', to: 'home#dashboard'
end
