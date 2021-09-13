class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.rides.alphabetical_order
    @average = @rides.average_thrill_rating
  end
end
