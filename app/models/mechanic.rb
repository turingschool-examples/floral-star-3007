class Mechanic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :years_experience
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def open_rides_order
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
