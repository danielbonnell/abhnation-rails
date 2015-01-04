Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:show, :edit, :put]
end
