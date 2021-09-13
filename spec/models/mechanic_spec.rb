require "rails_helper"

RSpec.describe Mechanic do
  describe "relationships" do
    it { should have_many(:ride_mechanics)}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  before :each do
    @park = AmusementPark.create!(name: "Universal", price_of_admission: 120)
    @m1 = Mechanic.create!(name: "George", years_of_experience: 7)
    @m2 = Mechanic.create!(name: "Alison", years_of_experience: 5)
    @m3 = Mechanic.create!(name: "Gary", years_of_experience: 2)
    @m4 = Mechanic.create!(name: "Georgina", years_of_experience: 10)
    @r1 = @park.rides.create!(name: "The Hulk", thrill_rating: 7, open: true)
    @r2 = @park.rides.create!(name: "Hogwarts Castle", thrill_rating: 6, open: true)
    @r3 = @park.rides.create!(name: "Dueling Dragons", thrill_rating: 7, open: false)
    @r4 = @park.rides.create!(name: "Spiderman", thrill_rating: 4, open: true)
    RideMechanic.create!(mechanic: @m1, ride:@r1)
    RideMechanic.create!(mechanic: @m1, ride:@r2)
    RideMechanic.create!(mechanic: @m1, ride:@r4)
    RideMechanic.create!(mechanic: @m2, ride:@r1)
    RideMechanic.create!(mechanic: @m2, ride:@r4)
    RideMechanic.create!(mechanic: @m3, ride:@r1)
    RideMechanic.create!(mechanic: @m3, ride:@r4)
  end

  it 'has average years of experience' do
    expect(Mechanic.average_years).to eq(6)
  end
end
