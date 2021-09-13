require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  it "alphabetizes a parks rides" do
    park = AmusementPark.create!(name: "State Fair", price_of_admission: 12.99)
    ride1 = Ride.create!(name: "The Mangler", thrill_rating: 6, open: true, amusement_park_id: park.id)
    ride2 = Ride.create!(name: "Puke-A-Thon", thrill_rating: 8, open: true, amusement_park_id: park.id)
    ride3 = Ride.create!(name: "Topsy Scurvy", thrill_rating: 3, open: false, amusement_park_id: park.id)

    expect(park.alphbetize).to eq([ride2, ride1, ride3])
  end

  it "returns the average thrill rating of all the park's rides" do
    park = AmusementPark.create!(name: "State Fair", price_of_admission: 12.99)
    ride1 = Ride.create!(name: "The Mangler", thrill_rating: 6, open: true, amusement_park_id: park.id)
    ride2 = Ride.create!(name: "Puke-A-Thon", thrill_rating: 8, open: true, amusement_park_id: park.id)
    ride3 = Ride.create!(name: "Topsy Scurvy", thrill_rating: 3, open: false, amusement_park_id: park.id)
    ride4 = Ride.create!(name: "Pioneer Railroad", thrill_rating: 1, open: true, amusement_park_id: park.id)
    ride5 = Ride.create!(name: "Goldpanner Challenge", thrill_rating: 2, open: true, amusement_park_id: park.id)

    expect(park.thrill_average).to eq(4)
  end
end
