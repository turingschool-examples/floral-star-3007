require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    before :each do
      @park = AmusementPark.create!(name: "Six Flags", price_of_admission: 75)

      @ride_1 = @park.rides.create!(name: "Rollercoaster", thrill_rating: 7, open: true)
      @ride_2 = @park.rides.create!(name: "Kiddie Coaster", thrill_rating: 3, open: true)
      @ride_3 = @park.rides.create!(name: "Swings", thrill_rating: 5, open: false)
      @ride_4 = @park.rides.create!(name: "Tower Drop", thrill_rating: 9, open: true)
    end

    describe '.rides_alpha' do
      it "returns a parks rides alphabetically" do
        expect(@park.rides_alpha).to eq([@ride_2, @ride_1, @ride_3, @ride_4])
      end
    end

    describe '.av_rating' do
      it "returns the average thrill rating for all rides in a park" do
        expect(@park.av_rating).to eq(6)
      end
    end
  end
end
