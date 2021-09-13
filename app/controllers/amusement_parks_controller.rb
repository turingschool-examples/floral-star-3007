class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @average_thrill = @park.rides.order_by_name.average_thrill
  end
end