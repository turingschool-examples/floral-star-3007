require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  it "averages years experience" do
    mech1 = Mechanic.create!(name: "Ida Olson", years_experience: 14)
    mech2 = Mechanic.create!(name: "Sarah Carter", years_experience: 10)

    expect(Mechanic.average_experience).to eq(12)
  end

  it "only returns a mechanic's rides that are open and ranks them by thrill rating" do
    park = AmusementPark.create!(name: "State Fair", price_of_admission: 12.99)
    mech1 = Mechanic.create!(name: "Ida Olson", years_experience: 14)
    ride1 = Ride.create!(name: "The Mangler", thrill_rating: 6, open: true, amusement_park_id: park.id)
    ride2 = Ride.create!(name: "Puke-A-Thon", thrill_rating: 8, open: true, amusement_park_id: park.id)
    ride3 = Ride.create!(name: "Topsy Scurvy", thrill_rating: 3, open: false, amusement_park_id: park.id)
    mech1.rides << ride1
    mech1.rides << ride2
    mech1.rides << ride3

    expect(mech1.open_rides).to eq([ride2, ride1])
  end
end
