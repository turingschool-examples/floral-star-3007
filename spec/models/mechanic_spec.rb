require 'rails_helper'

RSpec.describe Mechanic do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end

  describe 'relationships' do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    it 'returns the average experience of all mechanics' do
      mechanic_1 = Mechanic.create!(name: "Sarah", years_experience: 7)
      mechanic_1 = Mechanic.create!(name: "Tim", years_experience: 4)
      mechanic_1 = Mechanic.create!(name: "John", years_experience: 2)

      expect(Mechanic.average_experience).to eq(4.33)
    end
  end

  describe 'instance methods' do
    it 'orders open rides by thrill rating' do
      park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
      mechanic_1 = Mechanic.create!(name: "John", years_experience: 4)
      ride_1 = mechanic_1.rides.create!(name: "Twister", thrill_rating: 5, open: true, amusement_park_id: park.id)
      ride_2 = mechanic_1.rides.create!(name: "Mind Eraser", thrill_rating: 9, open: true, amusement_park_id: park.id)

      expect(mechanic_1.open_rides_order).to eq([ride_2, ride_1])
    end
  end
end
