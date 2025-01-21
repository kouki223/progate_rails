Rails.application.routes.draw do
  
  # 以下、users
  get "users/index" => "users#index"
  get "/signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" =>"users#edit"
  post "users/:id/update" => "users#update"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/likes" => "users#likes"
  
  get "users/:id" => "users#show"
  
  # 以下、posts
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id" => "posts#show" #これより下にposts関連は書かない！
  
  # 以下、home
  get "/" => "home#top"
  get "/about" => "home#about"
  
  # 以下、likes
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
end
