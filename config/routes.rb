Rails.application.routes.draw do
  resources :sms_messages, except: [:new, :edit, :destroy, :update]
  resources :orders, only: [:create, :show, :update]
  get 'orders/find'
  post 'orders/email'
  resources :airlines, only: [:index, :show]
end
