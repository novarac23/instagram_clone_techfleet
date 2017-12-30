Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update]
  resources :photos, only: [:new, :create, :index, :show] do
    put "like", to: "photos#like"
    put "dislike", to: "photos#dislike"
  end
  resources :sessions, only: [:new, :create]
  resource :comments, only: [:create]
end
