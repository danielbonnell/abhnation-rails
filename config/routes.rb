Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :edit, :put, :index]

  resources :categories, only: [:show, :index] do
    resources :articles, only: [:show, :index]
  end

  namespace :admin do
    root 'homes#index'

    resources :users
    resources :categories do
      resources :articles
    end
  end
end
