Rails.application.routes.draw do


  resources :users, only: [:new, :create]
  resources :blogs, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create]

  root to: "blogs#index"
end
