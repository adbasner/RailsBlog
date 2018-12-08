Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  get 'pages/home', to: 'pages#home'
  get 'pages/about' => 'pages#about'

end
