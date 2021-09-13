class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:park_id])
  end
end
