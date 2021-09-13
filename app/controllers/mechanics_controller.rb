class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mech_id])
    @ordered_rides = @mechanic.rides.order_by_thrill
  end

  def update
    mechanic = Mechanic.find(params[:mech_id])
    mechanic.rides << Ride.find(params[:ride_id])

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
