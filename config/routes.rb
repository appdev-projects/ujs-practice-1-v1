Rails.application.routes.draw do
  root 'tasks#index'
  
  devise_for :users

  resources :tasks do
    patch "forward", on: :member
    patch "back", on: :member
  end
  
end
