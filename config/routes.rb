Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
