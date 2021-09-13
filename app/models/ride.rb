class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics, dependent: :destroy
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides(mechanic_id)
    joins(:mechanics).where(["open = ? and mechanic_id = ?", true, mechanic_id]).order(thrill_rating: :desc).pluck(:name)
  end
end
