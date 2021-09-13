class AmusementPark < ApplicationRecord
  has_many :rides

  def alphabetical_order
    rides.order(:name)
  end

  def average_thrill_rating
    rides.average(:thrill_rating).round
  end
end
