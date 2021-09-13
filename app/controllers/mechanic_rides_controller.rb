class MechanicRidesController < ApplicationController
  def create
    mechanic_rides = MechanicRide.create!(mechanic_ride_params)
  end

  private
  def mechanic_ride_params
    params.permit(:mechanic_id, :ride_id)
  end
end
