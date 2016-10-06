Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "users#index"

get "/login", to: "sessions#new"
post "/sessions", to: "sessions#create"

end
