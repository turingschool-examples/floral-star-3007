require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  before :each do
    @park         = AmusementPark.create!(name: "Busch Gardens", price_of_admission: 50)
    @twister      = @park.rides.create!(name: "Twister", thrill_rating: 10, open: true)
    @boggler      = @park.rides.create!(name: "Boggler", thrill_rating: 7, open: true)
    @river_cruise = @park.rides.create!(name: "River Cruise", thrill_rating: 1, open: true)
    @dare_devil   = @park.rides.create!(name: "Daredevil", thrill_rating: 9, open: false)
  end

  describe 'class methods' do
    describe '#only_open' do
      it 'returns only the rides that are open' do
        expect(Ride.only_open).to eq([@twister, @boggler, @river_cruise])
      end
    end

    describe '#sort_by_thrill_rating' do
      it 'sorts the rides by their thrill rating in descending order' do
        expect(Ride.sort_by_thrill_rating).to eq([@twister, @dare_devil, @boggler, @river_cruise])
      end
    end
  end
end
