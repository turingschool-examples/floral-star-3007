class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.order_by_thrill
    order(thrill_rating: :desc)
  end

  def self.open_rides
    where(open: true)
  end
end
