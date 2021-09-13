class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_rides_by_thrill_rating
  end

  def add_ride
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:search])
    @mechanic.rides << @ride
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
