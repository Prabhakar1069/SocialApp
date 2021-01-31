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
    resources :friendships, only: %i[index new create show destroy]
      
  end
  resources :posts do 
    resources :comments
  end

  resources :posts, only: %i[index new create show] do
    resources :likes, only: %i[create]
  end

  resources :comments do
    resources :likes, only: %i[create]
  end

  
  
  get 'list/friend'
  get '/search' => 'list#search', :as => 'search_list'

  get 'user/:id/friendrequest', to: 'list#search', as: 'user_friendrequest' 
  get 'users/:id/friendrequests', to:'friendships#friendrequest',as: 'sent_friendrequests'
  post 'users/:id/friendrequests', to:'friendships#accept'

  # post 'user/:user_id/friendrequest/:id', to: 'list#sentrequest', as: 'user_sentrequest'
  
  # root 'welcome#index'

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
