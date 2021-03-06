Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      resources :compositions, only: %i[create show update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/get_user', to: 'auth#show'
    end
  end
end
