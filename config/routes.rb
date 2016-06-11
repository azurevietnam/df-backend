Rails.application.routes.draw do
  resources :orders, only: [:create, :show, :update]
  get 'orders/find'
  post 'orders/email'
  resources :airlines, only: [:index, :show]
end
