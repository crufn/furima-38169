Rails.application.routes.draw do
  devise_for :users
  root to: 'proto#index'

  resources :orders, only:[:create]
  resources :users
  resources :proto, only: [:index, :new]
end
