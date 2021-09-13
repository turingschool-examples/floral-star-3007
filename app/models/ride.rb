class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics, dependent: :destroy
  has_many :mechanics, through: :ride_mechanics

  def self.open?
    where(open: true)
  end
end
