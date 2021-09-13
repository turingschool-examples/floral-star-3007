require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    describe '.rides_alphabetically' do
      it 'orders rides alphabetically' do
        hpw = AmusementPark.create!(name: "Harry Potter World", price_of_admission: 20)
        ride1 = hpw.rides.create!(name: "Ferris Wheel", thrill_rating: 2, open: true)
        ride2 = hpw.rides.create!(name: "Tea Cups", thrill_rating: 3, open: false)
        ride3 = hpw.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)

        expect(hpw.rides_alphabetically).to eq([ride1, ride3, ride2])
      end
    end
  end
end
