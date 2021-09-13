require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe "methods" do
    it "#average_years_of_experience" do
      mechanic_1 = Mechanic.create!(name: 'Ted', years_experience: 9)
      mechanic_2 = Mechanic.create!(name: 'Bob', years_experience: 11)

      expect(Mechanic.average_years_of_experience).to eq(10)
    end
  end
end
