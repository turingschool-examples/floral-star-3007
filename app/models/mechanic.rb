class Mechanic < ApplicationRecord
    has_many :mechanic_rides
    has_many :rides, through: :mechanic_rides

    def self.avg_years_experience
        self.average(:years_experience)
    end
end