class AmusementPark < ApplicationRecord
  has_many :rides

  def ordered_rides
    rides.order(:name)
  end
end
