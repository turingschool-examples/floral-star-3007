require 'rails_helper'
# rspec spec/models/mechanic_spec.rb
RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class method' do
    it 'calcs the average years of experience across all mechanics' do
      sara = Mechanic.create!(name: "Sara", experience: 20)
      fred = Mechanic.create!(name: "Fred", experience: 10)

      expect(Mechanic.avg_experience).to eq(15)
    end
  end
end
