class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.ave_experience
    average(:years_of_experience)
  end

  def open_rides_desc_thrill
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
