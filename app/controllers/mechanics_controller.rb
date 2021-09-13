class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    ride     = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:id])
    mechanic.rides << ride

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
