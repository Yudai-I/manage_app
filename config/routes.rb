Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'attendance' => 'attendances#attendance'
    post 'start_time' => 'attendances#start_time'
    post 'end_time' => 'attendances#end_time'
  end
end
