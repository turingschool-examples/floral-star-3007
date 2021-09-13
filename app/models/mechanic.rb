class Mechanic < ApplicationRecord
  has_many :mechanic_rides, dependent: :destroy
  has_many :rides, through: :mechanic_rides
end
