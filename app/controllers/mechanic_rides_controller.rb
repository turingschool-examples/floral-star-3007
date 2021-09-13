class MechanicRidesController < ApplicationController

  def create
    mechanic_ride = MechanicRide.new(mechanic_ride_params)
    mechanic_ride.save

    redirect_to mechanic_path(params[:mechanic_id])
  end

  private

  def mechanic_ride_params
    params.permit(:ride_id, :mechanic_id)
  end
end
