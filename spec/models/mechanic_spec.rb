require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '#ave_experience' do
      it 'caculates average experience for all mechanics' do
        mechanic1 = Mechanic.create!(name: "Gypsy", years_of_experience: 15)
        mechanic2 = Mechanic.create!(name: "Daisy", years_of_experience: 10)
        mechanic3 = Mechanic.create!(name: "Rosie", years_of_experience: 20)

        expect(Mechanic.ave_experience).to eq(15.0)
      end
    end
  end

  describe 'instance methods' do
    describe '.open_rides_desc_thrill' do
      it 'lists open rides in descending order by thrill rating' do
        hpw = AmusementPark.create!(name: "Harry Potter World", price_of_admission: 20)
        mechanic1 = Mechanic.create!(name: "Gypsy", years_of_experience: 15)
        ride1 = hpw.rides.create!(name: "Ferris Wheel", thrill_rating: 2, open: true)
        ride2 = hpw.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
        ride3 = hpw.rides.create!(name: "Tea Cups", thrill_rating: 3, open: false)
        RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)
        RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic1.id)
        RideMechanic.create!(ride_id: ride3.id, mechanic_id: mechanic1.id)

        expect(mechanic1.open_rides_desc_thrill).to eq([ride2, ride1])
      end
    end
  end
end
