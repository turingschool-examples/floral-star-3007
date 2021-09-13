class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    ride = RideMechanic.create!(ride_params)
    redirect_to "/mechanics/#{mechanic.id}"
  end

  private

  def ride_params
    params.permit(:mechanic_id, :ride_id)
  end
end
