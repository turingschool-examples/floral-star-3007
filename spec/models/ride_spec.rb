require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }

  end

  describe 'class methods' do
    it 'orders the rides by thrill rating' do
      @ki = AmusementPark.create!(name: "King's Island", price_of_admission: 45)
      @beast = @ki.rides.create!(name: "The Beast", thrill_rating: 4, open: true)
      @diamond = @ki.rides.create!(name: "Diamond Back", thrill_rating: 5, open: true)
      @racers = @ki.rides.create!(name: "The Racers", thrill_rating: 2, open: false)
      @adventure = @ki.rides.create!(name: "Adventure Express", thrill_rating: 3, open: true)

      expect(Ride.order_by_thrill).to eq([@diamond, @beast, @adventure, @racers])
    end

    it 'shows only open rides' do
      @ki = AmusementPark.create!(name: "King's Island", price_of_admission: 45)
      @beast = @ki.rides.create!(name: "The Beast", thrill_rating: 4, open: true)
      @diamond = @ki.rides.create!(name: "Diamond Back", thrill_rating: 5, open: true)
      @racers = @ki.rides.create!(name: "The Racers", thrill_rating: 2, open: false)
      @adventure = @ki.rides.create!(name: "Adventure Express", thrill_rating: 3, open: true)

      expect(Ride.open_rides).to eq([@beast, @diamond, @adventure])
    end
  end
end
