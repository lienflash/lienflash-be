Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      post '/login', to: 'users#login'
      get '/users/verified', to: 'users#auto_login'

      resources :users do
        post '/jobs', to: 'jobs#create'
        get '/jobs/:id', to: 'jobs#show'
        get '/jobs', to: 'jobs#index'
        patch '/jobs/:id', to: 'jobs#update'
      end
      namespace :admin do
        get '/users', to: 'users#index'
        get '/users/:id', to: 'users#show'
        delete '/users/:id', to: 'users#delete'
        get '/users/:id/jobs', to: 'user_jobs#index'
        get '/users/:user_id/jobs/:job_id', to: 'user_jobs#show'
        patch '/users/:user_id/jobs/:job_id', to: 'user_jobs#update'
      end
    
    end
  end
end
