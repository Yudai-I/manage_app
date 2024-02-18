Rails.application.routes.draw do
  devise_for :users
  resources :user, only: [:show]
end
