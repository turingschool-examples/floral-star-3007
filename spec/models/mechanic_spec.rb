require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  before :each do
    @mechanic_1 = Mechanic.create!(name: "Manny", experience: 10)
    @mechanic_2 = Mechanic.create!(name: "Moe", experience: 15)
    @mechanic_3 = Mechanic.create!(name: "Jack", experience: 20)
  end

  describe 'class methods' do
    describe '#average_experience' do
      it 'returns the average experience of all mechanics' do
        expect(Mechanic.average_experience).to eq(15)
      end
    end
  end
end
