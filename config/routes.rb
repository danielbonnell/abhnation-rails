Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :edit, :put, :index]

  resources :categories, only: [:show, :index] do
    resources :articles, only: [:show, :index]
  end
end
