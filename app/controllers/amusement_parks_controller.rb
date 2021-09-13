class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @park_rides = @park.alphbetize
  end
end
