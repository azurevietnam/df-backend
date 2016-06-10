Rails.application.routes.draw do
  resources :orders, only: [:create, :show, :find]
  get 'orders/find'
  post 'orders/email'
  resources :airlines, only: [:index, :show]
end
