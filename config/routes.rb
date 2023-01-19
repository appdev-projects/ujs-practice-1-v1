Rails.application.routes.draw do

  resources :tasks
  devise_for :users

  root "tasks#index"

  put "tasks/:id/move", action: :move, controller: :tasks, as: :move_task


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
