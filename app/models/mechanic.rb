class Mechanic < ApplicationRecord
  has_many :rides_mechanics
  has_many :rides, through: :rides_mechanics

  def self.avg_exp
    average(:years_experience)
  end 
end
