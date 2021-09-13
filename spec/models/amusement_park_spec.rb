require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    it 'can sort alphabetically' do
      park = AmusementPark.create!(name: 'Yada Thrills', price_of_admission: 4)
      ride1 = park.rides.create!(name: 'Hurler', thrill_rating: 10, open: true)
      ride2 = park.rides.create!(name: 'Tosser', thrill_rating: 5, open: true)
      ride3 = park.rides.create!(name: 'Lazy', thrill_rating: 1, open: true)

      expect(park.alphabetical_rides).to eq([ride1, ride3, ride2])
    end
  end
end
