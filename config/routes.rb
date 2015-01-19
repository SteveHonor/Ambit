Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#index"

  match 'users/show', to: 'users#show', via: 'get'
end
