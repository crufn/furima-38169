Rails.application.routes.draw do
  root to: 'proto#index'

  resources :orders, only:[:create]
end
