class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_order
    rides.order(:name)
  end

  def average_ride_thrill_rating
    rides.average(:thrill_rating)
  end
end
