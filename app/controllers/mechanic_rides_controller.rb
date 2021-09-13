class MechanicRidesController < ApplicationController


  def new
    mech = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params['Add ride'])
    mech.rides << ride
    redirect_to "/mechanics/#{mech.id}"
  end

end
