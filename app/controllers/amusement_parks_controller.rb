class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @average_thrill = Ride.order_by_name.average_thrill
  end
end