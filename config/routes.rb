TumblrToyProject::Application.routes.draw do
  resources :tumblrs

  resources :authorizations

  resources :users

 root :to => 'sessions#new'

  # resources :users, :only => [ :show, :edit, :update ]

  post '/oauth/request_token' => 'sessions#new'

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
end
