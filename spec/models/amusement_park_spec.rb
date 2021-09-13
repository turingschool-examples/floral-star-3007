require 'rails_helper'

RSpec.describe AmusementPark do
  before(:each) do
    @cp = AmusementPark.create!(name: "Cedar Point", price_of_admission: 60)
    @topthrill = Ride.create!(name: "Top Thrill Dragster", thrill_rating: 9, open: false, amusement_park: @cp)
    @maverick = Ride.create!(name: "Maverick", thrill_rating: 8, open: true, amusement_park: @cp)
    @millenium = Ride.create!(name: "Millenium Force", thrill_rating: 10, open: true, amusement_park: @cp)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    it 'orders rides alphabetically' do
      expect(@cp.alphabetical_rides).to eq([@maverick, @millenium, @topthrill])
    end
  end
end
