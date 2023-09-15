Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/edit'
  get 'fridge_list/index'
  get 'fridge_list/new'
  get 'fridge_list/edit'
  devise_for :users

  root to: "pages#home"

<<<<<<< HEAD
  resources :fridge_lists, only: [:show] do
   resources :ingredients, only: [ :index, :destroy]
  end
=======
  resources :fridge_lists  #except: [:show]
>>>>>>> 05a4727087a2bc275b8d820ba648190b8bc48800

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end
<<<<<<< HEAD

  resources :fridge_list_ingredients, only: [:]
=======
  resources :ingredients, only: [:destroy]
>>>>>>> 05a4727087a2bc275b8d820ba648190b8bc48800
  resources :reviews, only: [:destroy]








  get "recipes/:recipe_id/like", to: "recipes#like", as: :like
  get "recipes/:recipe_id/unlike", to: "recipes#unlike", as: :unlike

  get "favorites", to: "recipes#all_favorite_recipes", as: :favorites


end
