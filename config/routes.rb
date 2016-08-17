Rails.application.routes.draw do
  scope '/api' do
    namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
      get ':username/posts' => 'posts#index'
      get ':username/public_profile' => 'public_profiles#show'
    end

    patch 'me/avatar' => 'avatar_images#update'
    patch 'me' => 'users#update'

    post 'follow/:user_id' => 'relationships#create'
    delete 'unfollow/:user_id' => 'relationships#destroy'

    resources :posts, only: [:index, :create] do
      resource :likes, only: [:create, :destroy], module: :posts
      resources :comments, only: [:create], module: :posts
    end

    resources :locations, only: [:show]
  end
end
