Rails.application.routes.draw do
  get 'fridge_list/index'
  get 'fridge_list/new'
  get 'fridge_list/edit'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
