Rails.application.routes.draw do

  devise_for :users
  root to: "dashboard#index"

  resources :infractions
  resources :users
  resources :laws

  get '/supervisions/infractions', to: 'supervisions#infractions'
  get '/supervisions/infractions/:id', to: 'supervisions#infractions_show'
  get '/infractions/:id/supervisions/new', to: 'supervisions#new'

  delete '/fines/:id', to: 'supervision/infractions#delete_fine'

  get '/infraction/:id/generate/notification', to: 'infractions#generate', as: 'generate_notification'

  resources :supervisions
  # namespace :supervision do
  #   resources :infractions
  #   resources :assessments
  #
  #   get '/assessments/:id/generate', to: 'assessments#update', as: 'generate_assessment'
  # end
end
