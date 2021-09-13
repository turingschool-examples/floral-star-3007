require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  it "averages years of experience" do
    mech1 = Mechanic.create!(name: "Ida Olson", years_experience: 14)
    mech2 = Mechanic.create!(name: "Sarah Carter", years_experience: 10)

    expect(Mechanic.average_experience).to eq(12)
  end
end
