Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'attendance' => 'attendances#attendance'
    get 'work' => 'attendances#work'
    post 'start_work' => 'attendances#start_work'
    post 'end_work' => 'attendances#end_work'
  end

  namespace :admin do
    get 'attendance' => 'attendances#attendance'
  end
end
