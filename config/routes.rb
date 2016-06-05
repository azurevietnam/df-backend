Rails.application.routes.draw do
  resources :orders, only: [:create, :show, :find]
  get 'orders/find'
  resources :airlines, only: [:index, :show]
end
