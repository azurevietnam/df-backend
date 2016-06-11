Rails.application.routes.draw do
  resources :orders, only: [:create, :show]
  get 'orders/find'
  post 'orders/email'
  resources :airlines, only: [:index, :show]
end
