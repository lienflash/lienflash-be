Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      post '/login', to: 'users#login'

      resources :user do
        post '/jobs', to: 'jobs#create'
        get '/jobs/:id', to: 'jobs#show'
        get '/jobs', to: 'jobs#index'
        patch '/jobs/:id', to: 'jobs#update'
      end
    end
  end
end
