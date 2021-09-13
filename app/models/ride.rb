class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics, dependent: :delete_all
  has_many :mechanics, through: :ride_mechanics
end
