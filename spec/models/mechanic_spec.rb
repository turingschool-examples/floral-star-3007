require 'rails_helper'


RSpec.describe Mechanic do
  describe 'relationships'do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    it 'average experience' do
      Mechanic
      mech1 = Mechanic.create!(name: "Bill", years_experience: 2)
      mech2 = Mechanic.create!(name: "Janet", years_experience: 7)

      expect(Mechanic.average_experience).to eq(4.5)
    end
  end

  describe 'instance methods' do
    it 'sorts rides' do
      mech = Mechanic.create!(name: "Janet", years_experience: 7)
      park = AmusementPark.create!(name: 'Yada Thrills', price_of_admission: 4)
      ride1 = park.rides.create!(name: 'Hurler', thrill_rating: 10, open: true)
      ride2 = park.rides.create!(name: 'Lazy', thrill_rating: 1, open: true)
      ride3 = park.rides.create!(name: 'Tosser', thrill_rating: 5, open: true)

      mech.rides << ride1
      mech.rides << ride2
      mech.rides << ride3

      expect(mech.sorted_rides).to eq([ride1, ride3, ride2])
    end
  end
end
