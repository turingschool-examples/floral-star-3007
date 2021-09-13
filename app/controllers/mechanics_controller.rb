class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_exp = Mechanic.average_experience
  end
end