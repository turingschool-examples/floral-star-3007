require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @kara = Mechanic.create!(name: "Kara Johnson", yrs_xp: 12)
    @willie = Mechanic.create!(name: "Willie Walsh", yrs_xp: 32)
  end
  describe 'relationships' do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    it 'has average experience for all' do
      expect(Mechanic.avg_xp).to eq(22)
    end
  end
end
