class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many   :mechanic_rides
  has_many   :mechanics, through: :mechanic_rides

  def self.currently_open_by_thrill
    where(open: true).order(thrill_rating: :desc)
  end
end
