Rails.application.routes.draw do
  get 'list/friend'
  get '/search' => 'list#search', :as => 'search_list'
  devise_for :users
  root  'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
