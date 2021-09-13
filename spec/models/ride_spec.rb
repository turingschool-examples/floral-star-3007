require 'rails_helper'

RSpec.describe Ride, type: :model do
  before(:each) do
    @cp = AmusementPark.create!(name: "Cedar Point", price_of_admission: 60)
    @topthrill = Ride.create!(name: "Top Thrill Dragster", thrill_rating: 9, open: false, amusement_park: @cp)
    @maverick = Ride.create!(name: "Maverick", thrill_rating: 8, open: true, amusement_park: @cp)
    @millenium = Ride.create!(name: "Millenium Force", thrill_rating: 10, open: true, amusement_park: @cp)
  end
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many(:mechanic_rides)}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe 'class methods' do
    it 'orders by thrill descending' do
      expect(Ride.order_by_thrill).to eq([@millenium, @topthrill, @maverick])
    end

    it '#average_thrill' do
      expect(Ride.average_thrill).to eq(9)
    end
  end
end
