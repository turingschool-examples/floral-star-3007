class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  scope :average_experience, -> {
    average(:years_of_experience)
  }

  def open_rides
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
