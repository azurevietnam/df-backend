Rails.application.routes.draw do
  resources :orders, only: [:create]
  resources :airlines, only: [:index, :show]
end
