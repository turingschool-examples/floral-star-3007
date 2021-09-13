require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  before(:each) do
    @speed     = Mechanic.create!(name: 'Speed Racer', years_experience: 5)
    @trixie    = Mechanic.create!(name: 'Trixie',      years_experience: 4)
    @chimchim  = Mechanic.create!(name: 'Chim-Chim',   years_experience: 2)
  end

  describe '.class methods' do
    describe '.avg_years_exp' do
      it 'calculates avg years experience' do
        expect(Mechanic.avg_years_exp).to eq(3.67)
      end
    end
  end
end
