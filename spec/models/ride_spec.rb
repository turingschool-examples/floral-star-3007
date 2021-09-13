require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  it 'can show only the open rides a mechanic is working on' do
  park_1 = AmusementPark.create!(name: "Six Flags", price_of_admission: 5)
  ride_1 = park_1.rides.create!(name: "Twister", thrill_rating: 4, open: true)
  ride_2 = park_1.rides.create!(name: 'Slingshot', thrill_rating:5, open: true)
  ride_3 = park_1.rides.create!(name: 'Bumper cars', thrill_rating:2, open:false)
  expect(Ride.open_only).to eq([ride_1, ride_2])
  end

  it 'lists rides in order of thrill rating' do
    park_1 = AmusementPark.create!(name: "Six Flags", price_of_admission: 5)
    ride_1 = park_1.rides.create!(name: "Twister", thrill_rating: 4, open: true)
    ride_2 = park_1.rides.create!(name: 'Slingshot', thrill_rating:5, open: true)
    ride_3 = park_1.rides.create!(name: 'Bumper cars', thrill_rating:2, open:false)
    expect(Ride.rating_order).to eq([ride_2, ride_1, ride_3])
  end
end
