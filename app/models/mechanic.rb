class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_experience
    average(:experience)
  end

  def working_on
    Ride.joins(:mechanics).where(rides: {open: true}).order(thrill_rating: :desc)
  end
end