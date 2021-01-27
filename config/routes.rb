Rails.application.routes.draw do
  root  'users#index'
  get 'friendships/create'
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'users/index'
  get 'users/show'
  get 'list/friend'
  get '/search' => 'list#search', :as => 'search_list'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
