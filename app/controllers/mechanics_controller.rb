class MechanicsController < ApplicationController
    def index
        @mechanics = Mechanic.all
    end

    def show 
        @mechanic = Mechanic.find(params[:id])
        @rides = @mechanic.mech_rides_filter
    end
end