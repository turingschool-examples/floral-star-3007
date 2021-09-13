require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before :each do
    @park1 = AmusementPark.create!(name: 'Funtown', price_of_admission: 50.00)
    @ride1 = Ride.create!(name: 'Carousel', thrill_rating: '10', open: true, amusement_park_id: @park1.id)
    @ride2 = Ride.create!(name: 'Slide', thrill_rating: '20', open: true, amusement_park_id: @park1.id)
    @ride3 = Ride.create!(name: 'Bumper Cars', thrill_rating: '30', open: true, amusement_park_id: @park1.id)
  end

  it 'gets ordered rides' do
    expect(@park1.ordered_rides).to eq([@ride1, @ride3, @ride2])
  end
end
