class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @ordered_rides = @park.ordered_rides
  end
end
