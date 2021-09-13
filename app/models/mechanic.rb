class Mechanic < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :rides, through: :ride_mechanics

  def self.average_years
    average(:years_of_experience).round
  end
end
