class RideMechanicsController < ApplicationController
  def create
    ridemechanic = RideMechanic.new(ride_id: params[:ride_id], mechanic_id: params[:mechanic_id])
    if ridemechanic.save
      redirect_to "/mechanics/#{params[:mechanic_id]}"
    else
      flash[:notice] = "**NOT A VALID RIDE ID**"
      redirect_to "/mechanics/#{params[:mechanic_id]}"
    end
  end
end
