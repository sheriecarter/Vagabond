Rails.application.routes.draw do
  get 'errors/not_found'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/users", to: "users#index"
  get "/users/new", to: "users#new", as: "new_user"
  get "/users/:id", to:"users#show", as: "user"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy", as: "destroy_user"

  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new", as: "new_post"
  get "/posts/:id", to: "posts#show", as: "post"
  post "/posts", to: "posts#create"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "/posts/:id", to: "posts#update"

  delete "/posts/:id", to: "posts#destroy", as: "destroy_post"

  get "/cities", to: "cities#index", as: "cities"
  get "/cities/new", to: "cities#new", as: "new_city"
  get "/cities/:id", to: "cities#show", as: "city"

  delete "/cities/:id", to: "cities#destroy", as: "destroy_city"


  resources :users do
    resources :posts
  end

  resources :cities do
    resources :posts
  end

  match "/404", :to => "errors#not_found", :via => :all

end
