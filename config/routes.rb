Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :fridge_lists do
    resources :ingredients, only: [:create]
  end

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end
  resources :ingredients, only: [:destroy]
  resources :reviews, only: [:destroy]
  
end
