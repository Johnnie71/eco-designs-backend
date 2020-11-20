Rails.application.routes.draw do
  

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
    end
  end 

  namespace :api do
    namespace :v1 do
      resources :designs
    end
  end

  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
