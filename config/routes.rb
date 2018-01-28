Rails.application.routes.draw do
  devise_for :admin_users
  resources :users
  resources :sites

  root to: "users#index"

end
