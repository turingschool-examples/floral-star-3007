class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.order_by_thrill
  end

  private
  def mechanic_params
    params.permit(:name, :experience)
  end
end
