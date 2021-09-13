class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @sorted_rides = @park.alphabetical_rides
  end

end
