class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha
    rides.order(:name)
  end

  def av_rating
    rides.average(:thrill_rating)
  end
end
