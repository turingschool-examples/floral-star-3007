require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  before(:each) do
    @speed_land = AmusementPark.create!(name: 'Speed Land', price_of_admission: 50)

    @frog_hop        = @speed_land.rides.create!(name: 'The Frog Hopper', thrill_rating: 2, open: true)
    @fahrenheit      = @speed_land.rides.create!(name: 'Fahrenheit', thrill_rating: 7, open: true)
    @kiss_raise      = @speed_land.rides.create!(name: 'The Kiss Raise', thrill_rating: 4, open: true)
    @lightning_racer = @speed_land.rides.create!(name: 'Lightning Racer', thrill_rating: 9, open: false)
    @storm_runner    = @speed_land.rides.create!(name: 'Storm Runner', thrill_rating: 8, open: false)
    @great_bear      = @speed_land.rides.create!(name: 'The Great Bear', thrill_rating: 6, open: false)
  end

  describe '.class methods' do
    describe '.currently_open' do
      it 'lists currently open rides' do
        expect(Ride.currently_open_by_thrill).to eq([@fahrenheit, @kiss_raise, @frog_hop])
      end
    end
  end
end
