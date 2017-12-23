Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :photos, only: [:new, :create]
end
