class Mechanic < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :rides, through: :ride_mechanics

  validates :name, presence: true
  validates :years_of_experience, presence: true
end
