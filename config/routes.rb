Rails.application.routes.draw do

  devise_for :admin_users

  resources :campaigns do
    get "active"
  end

  resources :sites do
    get "active"
  end

  get '/rtg' => 'retargeting#index'


  root to: "campaigns#index"

end
