class AmusementPark < ApplicationRecord
  has_many :rides

  def alphbetize
    rides.order(:name)
  end

  def thrill_average
    rides.average(:thrill_rating)
  end
end
