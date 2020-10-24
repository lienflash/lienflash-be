Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/jobs', to: 'jobs#create'
      get '/jobs', to: 'jobs#index'
    end
  end
end
