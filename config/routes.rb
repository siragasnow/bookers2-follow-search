Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  get 'users/:user_id/follows' => 'relationships#following', as: 'followings'
  get 'users/:user_id/followers' => 'relationships#follower', as: 'followers'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end