class MechanicRidesController < ApplicationController
  def create
    ride = Ride.find(params[:ride_ID])
    mechanic = Mechanic.find(params[:mechanic_id])
    mech_ride = MechanicRide.create(ride: ride, mechanic: mechanic)

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
