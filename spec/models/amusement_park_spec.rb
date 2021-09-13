require 'rails_helper'

RSpec.describe AmusementPark do
  before(:each) do
    @six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 49)

    @jon = Mechanic.create!(name: "Jon Doe", years_experience: 8)
    @kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    @roller = @six_flags.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
    @merry = @six_flags.rides.create!(name: "Merry Go Round", thrill_rating: 2, open: false)
    @hammer = @six_flags.rides.create!(name: "Hammer Hitter", thrill_rating: 3, open: true)

    MechanicRide.create!(mechanic: @jon, ride: @roller)
    MechanicRide.create!(mechanic: @jon, ride: @merry)
    MechanicRide.create!(mechanic: @jon, ride: @hammer)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe "#instance methods" do
    it "can order all rides in that amusement park in alphabetical order" do

      expect(@six_flags.alphabetical_order).to eq([@hammer, @merry, @roller])
    end

    it "can get an average thrill rating of all rides in the park" do

      expect(@six_flags.average_thrill_rating).to eq(5)
    end
  end
end
