Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#index"

  resources :users
  resources :laws

  delete '/fines/:id', to: 'supervision/notifications#delete_fine'

  namespace :supervision do
    resources :notifications
    resources :assessments

    get '/assessments/:id/pdf', to: 'assessments#update', as: 'generate_assessment'
  end
end
