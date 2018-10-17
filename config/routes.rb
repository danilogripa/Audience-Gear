Rails.application.routes.draw do

  get 'pages/index'
  post 'pages/send_email'

  devise_for :admin_users

  resources :advertisers do
    get "active"
  end

  resources :campaigns do
    get "active"
  end

  resources :affiliates do
    get "active"
  end

  # retarget routes
  get '/rtg' => 'retargeting#index'

  # main router
  root to: "pages#index"

end
