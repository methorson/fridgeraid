Rails.application.routes.draw do
  devise_for :users

  authenticated(:user) do
    root to: "fridge_lists#show", as: :authenticated_root
  end
  root to: "pages#home"

  resources :fridge_lists, only: [ :show ] do
   resources :fridge_list_ingredients, only: [:create]
  end

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end

  resources :ingredients, only: [:destroy]
  resources :reviews, only: [:destroy]








  get "recipes/:recipe_id/like_rails", to: "recipes#like_rails", as: :like
  get "recipes/:recipe_id/unlike_rails", to: "recipes#unlike_rails", as: :unlike
  get "recipes/:recipe_id/mark", to: "recipes#mark", as: :mark
  get "recipes/:recipe_id/mark_undone", to: "recipes#mark_undone", as: :unmark
  get "recipes/all_done_recipes", to: "recipes#all_done_recipes", as: :all_done
  get "favorites", to: "recipes#all_favorite_recipes", as: :favorites
  post '/recipes', to: 'recipes#index', as: 'search_recipes'


end
