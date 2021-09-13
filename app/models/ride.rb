class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.only_open
    Ride.where(open: true)
  end

  def self.sort_by_thrill_rating
    Ride.order(thrill_rating: :desc)
  end
end
