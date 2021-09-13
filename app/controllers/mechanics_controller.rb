class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_exp = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create!(ride: ride, mechanic: mechanic)

    redirect_to "/mechanics/#{params[:id]}"
  end
end