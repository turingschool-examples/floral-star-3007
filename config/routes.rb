Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  post '/ride_mechanics/new', to: 'ride_mechanics#create'
end
