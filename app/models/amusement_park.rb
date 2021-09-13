class AmusementPark < ApplicationRecord
  has_many :rides

  validates :name, presence: true
  validates :price_of_admission, presence: true
end
