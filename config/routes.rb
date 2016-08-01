Rails.application.routes.draw do
  scope '/api' do
    namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
    end

    patch 'me/avatar' => 'avatar_images#update'
  end
end
