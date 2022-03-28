Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:index, :create]
  end
end
