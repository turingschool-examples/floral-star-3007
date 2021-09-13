require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    let!(:park)  { AmusementPark.create(name: 'Six Flags', price_of_admission: 20) }
    let!(:ride1) { park.rides.create!(name: '2F2F', thrill_rating: 6, open: true, amusement_park_id: park.id) }
    let!(:ride2) { park.rides.create!(name: 'Splash Town', thrill_rating: 2, open: false) }
    let!(:ride3) { park.rides.create!(name: 'Bungie Jump', thrill_rating: 10, open: true) }

    it 'has an average thrill rating' do
      expect(park.average_thrill_rating).to eq(6)
    end

    it 'has rides in alphabetical order' do
      expect(park.ordered_rides).to eq([ride1, ride3, ride2])
    end
  end
end
