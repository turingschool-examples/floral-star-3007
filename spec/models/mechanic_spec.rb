require 'rails_helper'

RSpec.describe Mechanic do
  it { should have_many(:mechanic_rides) }
  it { should have_many(:rides).through(:mechanic_rides) }

  it 'gets average_experience' do
    @mech1 = Mechanic.create!(name: 'Jon', years_experience: 1)
    @mech2 = Mechanic.create!(name: 'Joe', years_experience: 4)
    @mech3 = Mechanic.create!(name: 'Jim', years_experience: 7)
    @mech4 = Mechanic.create!(name: 'Jan', years_experience: 10)

    expect(Mechanic.average_experience).to eq(5.5)
  end
end
