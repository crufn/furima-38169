Rails.application.routes.draw do
  devise_for :users
  root to: 'proto#index'

  resources :orders, only:[:create]
end
