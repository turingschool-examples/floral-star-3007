class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides_by_thrill_rating
    where(open: true)
    .order(thrill_rating: :desc)
  end

  def self.alphabetical_order
    order(:name)
  end

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end
