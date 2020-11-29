Rails.application.routes.draw do
  

  # resources :follow_joins
  # users
  namespace :api do
    namespace :v1 do
      resources :users
      get "/users/:id/designs", to: "users#designs"
      get "/users/:id/designs/:id", to: "designs#show"
      post "/users/:id/designs", to: "designs#create"
      delete "/users/:id/designs/:id", to: "designs#destroy"
      # get "/users/:id/designs/:id/comments", to: "users#comments"
      post "/users/:id/designs/:id/comments", to: "comments#create"
      delete "/users/:id/designs/:id/comments/:id", to: "comments#destroy"

      get 'users/:id/followers', to: 'users#follows'
     

      post '/feed', to: 'users#feed'
      
    end
  end 

  namespace :api do
    namespace :v1 do
      resources :designs
      get "/designs/:id/comments", to: "designs#comments"
      post "/designs/:id/comments", to: "comments#create"
    end
  end

  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end 

  namespace :api do
    namespace :v1 do
      resources :followers
      get '/follow_joins', to: 'followers#index'
      post '/follow_joins', to: 'followers#create'
      delete '/follow_joins/:id', to: 'followers#destroy'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
