Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :photos, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create]
  resource :comments, only: [:create]
end
