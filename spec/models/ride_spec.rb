require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  it "show sort rides by being open and by thrill rating" do
    six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
    mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
    ride_1 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 40, open: true, amusement_park_id: six_flags.id)
    ride_2 = mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 200, open: false, amusement_park_id: six_flags.id)
    ride_3 = mechanic_1.rides.create!(name: 'The Blade', thrill_rating: 100, open: true, amusement_park_id: six_flags.id)

    expect(Ride.open_rides_by_thrill_rating).to eq([ride_3, ride_1])
  end

  it "shows the average_thrill_rating" do
    six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
    mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
    ride_1 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: six_flags.id)
    ride_2 = mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 20, open: false, amusement_park_id: six_flags.id)
    ride_3 = mechanic_1.rides.create!(name: 'The Blade', thrill_rating: 10, open: true, amusement_park_id: six_flags.id)

    expect(Ride.average_thrill_rating).to eq(11)
  end

  it "shows the alphabetical_order" do
    six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
    mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
    ride_1 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: six_flags.id)
    ride_2 = mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 20, open: false, amusement_park_id: six_flags.id)
    ride_3 = mechanic_1.rides.create!(name: 'Blade', thrill_rating: 10, open: true, amusement_park_id: six_flags.id)

    expect(Ride.alphabetical_order).to eq([ride_3, ride_1, ride_2])
  end
end
