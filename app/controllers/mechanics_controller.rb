class MechanicsController < ApplicationController

  def index
    @mechs = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_by_rating
  end
end
