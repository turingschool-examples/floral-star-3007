class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :rides_mechanics
  has_many :mechanics, through: :rides_mechanics
end
