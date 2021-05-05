Rails.application.routes.draw do
  devise_for :users
  get "products/index"
  root "products#index"
  resources :products, only: [:new, :create, :index, :show, :edit, :update]
end
