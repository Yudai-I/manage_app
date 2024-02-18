Rails.application.routes.draw do
  resources :manages, only: [:show, :create]
end
