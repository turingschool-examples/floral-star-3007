class Mechanic < ApplicationRecord
  has_many :mechanic_rides, dependent: :destroy
  has_many :rides, through: :mechanic_rides

  def self.avg_xp
    average(:yrs_xp)
  end
end
