require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  it { should have_many(:rides).through(:mechanic_rides) }

  describe 'class methods' do
    let!(:mech1) { Mechanic.create!(name: 'Steve', years_of_experience: 10) }
    let!(:mech2) { Mechanic.create!(name: 'Jen', years_of_experience: 8) }

    it 'has the average years of experience' do
      expect(Mechanic.average_experience).to eq(9)
    end
  end
end
