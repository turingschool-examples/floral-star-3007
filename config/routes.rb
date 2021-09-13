Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :mechanics, only: [:index, :show, :create]
  
  get "/mechanics", to: "mechanics#index"
  get "/mechanics/:id", to: "mechanics#show"
  
  post "/mechanics/:id", to: "ride_mechanics#create"

  get "/amusement_parks/:id", to: "amusement_parks#show"
end
