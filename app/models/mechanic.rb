class Mechanic < ApplicationRecord
  has_many :rides_mechanics
  has_many :rides, through: :rides_mechanics
end
