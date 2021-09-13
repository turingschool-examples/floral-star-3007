class MechanicsController < ApplicationController
    def index
        @mechanics = Mechanic.all
    end

    def show 
        @mechanic = Mechanic.find(params[:id])
        @rides = @mechanic.mech_rides_filter
    end

    def add_ride
        MechanicRide.create({
            :ride_id => params[:ride_id],
            :mechanic_id => params[:mechanic_id]
        })        
    end
end