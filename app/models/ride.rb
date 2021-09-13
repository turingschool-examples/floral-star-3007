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

  def self.alpha_rides
    order(:name)
  end

  def self.average_thrill
    average(:thrill_rating)
  end
end
