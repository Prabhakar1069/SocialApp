Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: %i[index show] do
    resources :friendships, only: %i[create]
      
  end
  resources :posts, only: %i[index new create show] do
    resources :likes, only: %i[create]
  end

  resources :comments, only: %i[new create index] do
    resources :likes, only: %i[create]
  end

  
  # get 'friendships/create'
  # get 'likes/create'
  # get 'comments/new'
  # get 'comments/create'
  # get 'comments/index'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'users/index'
  # get 'users/show'
  get 'list/friend'
  get '/search' => 'list#search', :as => 'search_list'
  
  # root 'welcome#index'

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
