Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: 'items#index'
  resources :items
  resources :purchases, only: [:index, :new, :create]
end
