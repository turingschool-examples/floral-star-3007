require 'rails_helper'

describe Mechanic do
  describe 'relationship' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    it '#average_experience' do
      khoi = Mechanic.create!(name: "Khoi", experience: 5)
      duy = Mechanic.create!(name: "Duy", experience: 3)
      kathy = Mechanic.create!(name: "Kathy", experience: 4)

      expect(Mechanic.average_experience).to eq(4.0)
    end
  end

  describe 'instance methods' do
    it '#open_rides' do
      khoi = Mechanic.create!(name: "khoi", experience: 5)
      park = AmusementPark.create!(name: "Park of Amusement", price_of_admission: 80)
      ride_1 = park.rides.create!(name: "Nice Ride", thrill_rating: 10, open: true)
      ride_2 = park.rides.create!(name: "Another Nice Ride", thrill_rating: 8, open: false)
      ride_3 = park.rides.create!(name: "The Last Nice Ride", thrill_rating: 7, open: true)
      RideMechanic.create!(ride: ride_1, mechanic: khoi)
      RideMechanic.create!(ride: ride_2, mechanic: khoi)
      RideMechanic.create!(ride: ride_3, mechanic: khoi)

      expect(khoi.open_rides).to eq([ride_1, ride_3])
    end
  end
end