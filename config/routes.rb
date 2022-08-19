Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get "movies", to: "movies#index"
  get "lists", to: "lists#index"
  get "lists/new", to:"lists#new"
  post "lists/new", to:"lists#create", as: :list_create
  get "lists/:id", to:"lists#show", as: :list
  get "lists/:list_id/bookmarks/new", to:"bookmarks#new", as: :bookmark_new
  post "bookmarks", to:"bookmarks#create"



end
