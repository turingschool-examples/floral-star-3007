require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe "methods" do
    it "#average_years_of_experience" do
      mechanic_1 = Mechanic.create!(name: 'Ted', years_experience: 9)
      mechanic_2 = Mechanic.create!(name: 'Bob', years_experience: 11)

      expect(Mechanic.average_years_of_experience).to eq(10)
    end
    it "#rides_open" do
      amusement_park = AmusementPark.create!(name: 'Six Flags', price_of_admission: 2)
      mechanic = Mechanic.create!(name: 'Ted', years_experience: 9)
      ride_1 = amusement_park.rides.create!(name: 'mangler', thrill_rating: 9, open: true)
      ride_2 = amusement_park.rides.create!(name: 'spiderman', thrill_rating: 11, open: true)
      ride_3 = amusement_park.rides.create!(name: 'Batman', thrill_rating: 10, open: false)


      expect(mechanic.rides_open).to eq([ride_2, ride_1])
    end
  end
end
