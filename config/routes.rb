Rails.application.routes.draw do
  root to: "dashboard#index"

  resources :users
  resources :laws

  namespace :supervision do
    resources :notification
  end
end
