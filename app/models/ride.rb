class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.average_thrill
    average(:thrill_rating)
  end

  def self.order_by_name
    order(:name)
  end
end
