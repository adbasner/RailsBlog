Rails.application.routes.draw do
  resources :articles
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  root 'pages#home'
  # get 'pages/home',\ to: 'pages#home'
  get 'pages/about' => 'pages#about'


  # user info
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
