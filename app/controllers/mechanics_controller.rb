class MechanicsController < ApplicationController

  def index
    @mechs = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_by_rating
  end

  def update
    MechanicRide.create(mechanic_id: params[:id], ride_id: params[:ride_id])
    redirect_to "/mechanics/#{params[:id]}"  
  end
end
