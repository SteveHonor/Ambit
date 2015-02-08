Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#index"

  resources :users
  resources :laws

  namespace :supervision do
    resources :notification
  end
end
