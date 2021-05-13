Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :food_items
  get 'food_items/:id/apply', to: 'food_items#apply', as: 'apply'
  get 'food_items/:id/cancel', to: 'food_items#cancel', as: 'cancel'
  get '/orders', to: 'food_items#orders_list', as: 'orders'
end
