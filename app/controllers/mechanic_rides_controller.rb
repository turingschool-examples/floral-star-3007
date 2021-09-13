class MechanicRidesController < ApplicationController
  def create
    MechanicRide.create(mech_ride_params)

    redirect_to mechanic_path(params[:mechanic_id])
  end

  private

  def mech_ride_params
    params.permit(:ride_id, :mechanic_id)
  end
end
