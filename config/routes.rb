Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/edit'
  get 'fridge_list/index'
  get 'fridge_list/new'
  get 'fridge_list/edit'
  devise_for :users

  root to: "pages#home"

  resources :fridge_lists #except: [:show]

  resources :recipes, only: [ :index ] do
    resources :reviews, only: [:create]
  end
  resources :ingredients, only: [:create, :destroy]
  resources :reviews, only: [:destroy]

end
