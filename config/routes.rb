Rails.application.routes.draw do
  resources :users
  get "users/:id/likes" => "users#likes"

  get '/' => "home#top"
  get "/about" => "home#about"

  #名前付きルート使える
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  post "posts/:id/destroy" => "posts#destroy"
  get "search" => "posts#search"

  get "privateposts/new" => "privateposts#new"
  post "privateposts/create" => "privateposts#create"
  get "privateposts/:id" => "privateposts#show"
  post "privateposts/:id/destroy" => "privateposts#destroy"

  post "likes/:id/create" => "likes#create"
  post "likes/:id/destroy" => "likes#destroy"
  
end
