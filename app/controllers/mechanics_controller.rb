class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_only.rating_order
  end

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create(mechanic: mechanic, ride:ride)
    redirect_to "/mechanics/#{mechanic.id}"
  end

  # def mech_params
  #   params.permit(:name, :years_experience, :ride_id)
  # end
end
