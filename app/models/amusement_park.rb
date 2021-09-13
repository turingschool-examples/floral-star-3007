class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alphabetically
    rides.order(:name)
  end
end
