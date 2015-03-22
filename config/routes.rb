Rails.application.routes.draw do

  devise_for :users
  root to: "dashboard#index"

  resources :notifications
  resources :users
  resources :laws

  get '/supervisions/notifications', to: 'supervisions#notifications'
  get '/supervisions/notifications/:id', to: 'supervisions#notifications_show'
  get '/notifications/:id/supervisions/new', to: 'supervisions#new'

  delete '/fines/:id', to: 'supervision/notifications#delete_fine'

  resources :supervisions
  # namespace :supervision do
  #   resources :notifications
  #   resources :assessments
  #
  #   get '/assessments/:id/generate', to: 'assessments#update', as: 'generate_assessment'
  # end
end
