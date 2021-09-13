class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides, dependent: :destroy
  has_many :mechanics, through: :mechanic_rides

  def self.order_by_thrill
    order(thrill_rating: :desc)
  end

  def self.average_thrill
    average(:thrill_rating)
  end
end
