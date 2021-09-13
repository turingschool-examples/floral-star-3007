class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @alpha_rides = @park.rides.alpha_rides
  end
end
