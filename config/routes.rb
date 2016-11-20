Rails.application.routes.draw do
  scope '/api' do
    namespace :users do
      resources :notifications, only: [:index, :update]
      resource :notification_counts, only: [:show, :destroy]
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
      post 'facebook/login' => 'facebook_logins#create'
      get ':username/posts' => 'posts#index'
      get ':username/public_profile' => 'public_profiles#show'
      get ':username/followers' => 'followers#index'
      get ':username/following' => 'following#index'
    end

    patch 'me/avatar' => 'avatar_images#update'
    patch 'me' => 'users#update'

    post 'follow/:user_id' => 'relationships#create'
    delete 'unfollow/:user_id' => 'relationships#destroy'

    get 'posts/tags/:tag_name' => 'tags/posts#index'

    resources :posts, only: [:index, :create] do
      resource :likes, only: [:create, :destroy], module: :posts
      resources :comments, only: [:index, :create, :destroy], module: :posts
      resources :likers, only: [:index], module: :posts
    end

    resources :locations, only: [:show]

    resources :follow_suggestions, only: [:index]

    mount ActionCable.server => '/cable'
  end
end
