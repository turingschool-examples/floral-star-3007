require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do

    before :each do
      @park = AmusementPark.create!(name: "Six Flags", price_of_admission: 75)

      @ride_1 = @park.rides.create!(name: "Kiddie Coaster", thrill_rating: 3, open: true)
      @ride_2 = @park.rides.create!(name: "Rollercoaster", thrill_rating: 7, open: true)
      @ride_3 = @park.rides.create!(name: "Swings", thrill_rating: 5, open: false)
    end

    describe '#open_by_rating' do
      it "returns all open rides in order of thrill rating" do
        expect(Ride.open_by_rating).to eq([@ride_2, @ride_1])
      end
    end
  end
end
