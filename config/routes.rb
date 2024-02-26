Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'attendance' => 'attendances#attendance'
    get 'work' => 'attendances#work'
    get 'todo/:date' => 'attendances#show', as: 'todo'
    post 'start_work' => 'attendances#start_work'
    post 'end_work' => 'attendances#end_work'
    post 'attendance' => 'attendances#create_todo'
    patch 'todo/:id' => 'attendances#update_todo', as: 'update_todo'
    delete 'todo/:id' => 'attendances#destroy_todo', as: 'destroy_todo'
  end

  namespace :admin do
    get 'attendance' => 'attendances#attendance'
    post 'attendance' => 'attendances#new_shift'
  end
end
