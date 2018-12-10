Rails.application.routes.draw do
  
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  # static pages
  root 'pages#home'
  get 'pages/about' => 'pages#about'

  # artciles rest routes
  resources :articles

  # Users
  get 'signup' => 'users#new'
  # post '/users' => 'users#create'
  resources :users, except: [:new, :index, :destroy]

  # Sessions
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
