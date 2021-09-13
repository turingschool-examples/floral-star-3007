class MechanicRidesController < ApplicationController
    def create
        MechanicRide.create({
            ride_id: params[:ride_id],
            mechanic_id: params[:id]
        })
    end
end