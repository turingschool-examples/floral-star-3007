class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    mechanic.rides << ride
    mechanic_ride = MechanicRide.create!(mechanic: mechanic, ride: ride)

    redirect_to "/mechanics/#{mechanic.id}"
  end

  def new
  end
end
