require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'model tests' do
    it "shows average age for all mechanics" do
      mechanic_1 = Mechanic.create!(name: "Kevin", years_of_experience: 11)
      mechanic_2 = Mechanic.create!(name: "Marcy", years_of_experience: 25)
      mechanic_3 = Mechanic.create!(name: "Bob", years_of_experience: 2)

      expect(Mechanic.average_age.round(2)).to eq(12.67)
    end
  end
end
