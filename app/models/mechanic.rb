class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years_experience
    average(:years_experience)
  end

  def names_of_rides_working_on
    rides.where(open: false).pluck(:name)
  end

  def thrill_rating_desc
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
