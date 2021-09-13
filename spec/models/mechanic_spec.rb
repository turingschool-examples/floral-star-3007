require 'rails_helper'

describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides), through: :ride_mechanics }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_of_experience) }
  end

  describe 'methods' do
    describe 'average years of experience' do
      xit 'returns average years of experience' do
        mechanic1 = Mechanic.create!(name: "Jason", years_of_experience: 15)
        mechanic2 = Mechanic.create!(name: "Steven", years_of_experience: 7)

        expect(Mechanic.average_experience).to eq(11)
      end
    end
  end
end
