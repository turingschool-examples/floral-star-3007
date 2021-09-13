Rails.application.routes.draw do
  get 'ride_mechanics/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  post '/ride_mechanics/create', to: 'ride_mechanics#create'
end
