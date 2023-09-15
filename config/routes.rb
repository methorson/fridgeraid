Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/edit'
  get 'fridge_list/index'
  get 'fridge_list/new'
  get 'fridge_list/edit'
  devise_for :users

  root to: "pages#home"

  resources :fridge_lists  #except: [:show]

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end
  resources :ingredients, only: [:destroy]
  resources :reviews, only: [:destroy]








  get "recipes/:recipe_id/like", to: "recipes#like", as: :like
  get "recipes/:recipe_id/unlike", to: "recipes#unlike", as: :unlike

  get "favorites", to: "recipes#all_favorite_recipes", as: :favorites


end
