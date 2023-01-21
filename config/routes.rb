# == Route Map

Rails.application.routes.draw do
  root "photos#index"

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get ":username/liked" => "photos#liked", as: :liked_photos
  get ":username/feed" => "users#feed", as: :user_feed
  get ":username/followers" => "users#followers", as: :user_followers
  get ":username/following" => "photos#following", as: :photo_following

  get "/:username" => "users#show", as: :user
end
