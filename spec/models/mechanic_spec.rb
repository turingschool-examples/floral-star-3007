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
end
