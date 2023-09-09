Rails.application.routes.draw do
  devise_for :users do
    resources :recipe, only: [ :index]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :fridge_list, only: [ :index, :new, :edit, :update, :destroy ] do
      resources :ingredients, only: [ :create ]
    end
    resources :recipe, only: [ :show, :new, :create, :delete] do
      resources :reviews, only: [:create]
    end
    
    resources :ingredients, only: [ :destroy]
    resources :reviews, only: [:destroy]
end
