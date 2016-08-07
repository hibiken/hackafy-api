Rails.application.routes.draw do
  scope '/api' do
    namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
    end

    patch 'me/avatar' => 'avatar_images#update'
    patch 'me' => 'users#update'

    resources :posts, only: [:index, :create] do
      resource :likes, only: [:create, :destroy], module: :posts
    end
  end
end
