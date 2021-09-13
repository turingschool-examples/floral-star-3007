require 'rails_helper'

RSpec.describe Mechanic do
  it { should have_many(:mechanic_rides) }
  it { should have_many(:rides).through(:mechanic_rides) }

  before :each do
    @mech1 = Mechanic.create!(name: 'Jon', years_experience: 1)
    @mech2 = Mechanic.create!(name: 'Joe', years_experience: 4)
    @mech3 = Mechanic.create!(name: 'Jim', years_experience: 7)
    @mech4 = Mechanic.create!(name: 'Jan', years_experience: 10)
    @park = AmusementPark.create!(name: 'Funtown', price_of_admission: 50.00)
    @ride1 = @mech1.rides.create!(name: 'Bathroom', thrill_rating: '10', open: true, amusement_park_id: @park.id)
    @ride2 = @mech1.rides.create!(name: 'Slide', thrill_rating: '20', open: true, amusement_park_id: @park.id)
    @ride3 = @mech1.rides.create!(name: 'Bumper Cars', thrill_rating: '30', open: true, amusement_park_id: @park.id)

  end

  it 'gets average_experience' do
    expect(Mechanic.average_experience).to eq(5.5)
  end

  it 'gets open rides ordered by rating' do
    expect(@mech1.open_rides).to eq([@ride3, @ride2, @ride1])
  end
end
