Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
