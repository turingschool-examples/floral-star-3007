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

  def self.alphabetical_sort
    Ride.order(:name)
  end

  def self.average_thrill_rating
    Ride.average(:thrill_rating).to_f
  end
end
