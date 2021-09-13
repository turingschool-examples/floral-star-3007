require 'rails_helper'

describe Mechanic do
  describe 'relationship' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'instance methods' do
    it '#average_experience' do
      khoi = Mechanic.create!(name: "Khoi", experience: 5)
      duy = Mechanic.create!(name: "Duy", experience: 3)
      kathy = Mechanic.create!(name: "Kathy", experience: 4)

      expect(Mechanic.average_experience).to eq(4.0)
    end
  end
end