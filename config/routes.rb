Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :fridge_lists #except: [:show]

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end
  resources :ingredients, only: [:create, :destroy]
  resources :reviews, only: [:destroy]

end
