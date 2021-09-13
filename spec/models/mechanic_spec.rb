require 'rails_helper'


RSpec.describe Mechanic do
  describe 'relationships'do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    it 'average experience' do
      mech1 = Mechanic.create!(name: "Bill", years_experience: 2)
      mech2 = Mechanic.create!(name: "Janet", years_experience: 7)

      expect(Mechanic.average_experience).to eq(4.5)
    end
  end
end
