Rails.application.routes.draw do
  resources :mechanics, only: [:index, :show]

  resources :mechanic_rides, only: :create

  resources :amusement_parks, only: :show
end
