class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_only
    where('open = true')
  end

  def self.rating_order
    order(thrill_rating: :desc)
  end
end
