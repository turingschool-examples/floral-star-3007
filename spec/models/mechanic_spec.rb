require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    it 'averages years experience for all mechanics' do
      @martin = Mechanic.create!(name: "Mechanic Martin", years_experience: 25)
      @melvin = Mechanic.create!(name: "Mechanic Melvin", years_experience: 15)
      @mark = Mechanic.create!(name: "Mechanic Mark", years_experience: 10)
      @matt = Mechanic.create!(name: "Mechanic Matthew", years_experience: 10)

      expect(Mechanic.average_years_experience).to eq(15)
    end
  end
end
