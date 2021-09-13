require 'rails_helper'
# rspec spec/models/ride_spec.rb
RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do
    it 'returns only open rides' do
      @fun_park = AmusementPark.create!(name: "Fun Park", price_of_admission: 10)
      @best_ride = @fun_park.rides.create!(name: "Best Ride", thrill_rating: 2, open: true)
      @scariest_ride = @fun_park.rides.create!(name: "Scariest Ride", thrill_rating: 10, open: true)
      @closed_ride = @fun_park.rides.create!(name: "Closed Ride", thrill_rating: 6, open: false)

      expect(Ride.available).to eq([@best_ride, @scariest_ride])
    end

    it 'returns rides in order of thrill rating' do
      @fun_park = AmusementPark.create!(name: "Fun Park", price_of_admission: 10)
      @best_ride = @fun_park.rides.create!(name: "Best Ride", thrill_rating: 2, open: true)
      @scariest_ride = @fun_park.rides.create!(name: "Scariest Ride", thrill_rating: 10, open: true)
      @closed_ride = @fun_park.rides.create!(name: "Closed Ride", thrill_rating: 6, open: false)
    end
  end
end
