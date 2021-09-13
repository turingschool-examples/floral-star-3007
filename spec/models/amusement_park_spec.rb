require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do

    it 'orders rides in alphabetical order' do
      park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
      ride_1 = park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
      ride_2 = park.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: true)
      ride_3 = park.rides.create!(name: "Boomerang", thrill_rating: 9, open: true)

      expect(park.rides_order).to eq([ride_3, ride_2, ride_1])
    end

    it 'gets the average thrill rating of its rides' do
      park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
      ride_1 = park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
      ride_2 = park.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: true)
      ride_3 = park.rides.create!(name: "Boomerang", thrill_rating: 9, open: true)

      expect(park.average_ride_thrill_rating).to eq(9)
    end
  end
end
