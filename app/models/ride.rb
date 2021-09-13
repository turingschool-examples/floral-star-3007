class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics, dependent: :destroy
  has_many :mechanics, through: :ride_mechanics

  validates :name, presence: true
  validates :thrill_rating, presence: true
  validates :open, inclusion: { in: [true, false] }

  default_scope -> { order(thrill_rating: :desc) }
end
