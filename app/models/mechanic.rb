class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_exp
    average(:years_experience).to_f.round(2)
  end
end
