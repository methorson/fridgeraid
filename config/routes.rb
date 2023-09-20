Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :fridge_lists, only: [ :show ] do
   resources :fridge_list_ingredients, only: [:create]
  end

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end

  resources :ingredients, only: [:destroy]
  resources :reviews, only: [:destroy]








  get "recipes/:recipe_id/like", to: "recipes#like", as: :like
  get "recipes/:recipe_id/unlike", to: "recipes#unlike", as: :unlike
  get "recipes/:recipe_id/mark", to: "recipes#mark", as: :mark
  get "recipes/:recipe_id/mark_undone", to: "recipes#mark_undone", as: :unmark
  get "recipes/all_done_recipes", to: "recipes#all_done_recipes", as: :all_done
  get "favorites", to: "recipes#all_favorite_recipes", as: :favorites


end
