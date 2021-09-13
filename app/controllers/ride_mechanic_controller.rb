class RideMechanicController < ApplicationController

  def create
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = RideMechanic.create!([:id])
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
