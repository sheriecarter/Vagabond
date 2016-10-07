Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"


  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/users", to: "users#index"
  get "/users/new", to: "users#new", as: "new_user"
  get "/users/:id", to:"users#show", as: "user"
  post "/users", to: "users#create"

end
