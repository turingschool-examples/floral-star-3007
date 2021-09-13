class MechanicRidesController < ApplicationController
  def create
    mechanic_1 = Mechanic.find(params[:mechanic_id])
    MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: params[:ride_id])
    redirect_to "/mechanics/#{mechanic_1.id}"
  end
end
