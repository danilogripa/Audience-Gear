Rails.application.routes.draw do

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

  get '/rtg' => 'retargeting#index'
  get '/teste' => 'retargeting#testando'


  root to: "campaigns#index"

end
