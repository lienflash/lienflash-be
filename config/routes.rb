Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/jobs', to: 'jobs#create'
      get '/jobs', to: 'jobs#index'
      get '/jobs/:id', to: 'jobs#show'
    end
  end
end
