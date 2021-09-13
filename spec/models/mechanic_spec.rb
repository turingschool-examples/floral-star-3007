require "rails_helper"

RSpec.describe Mechanic do
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

  describe "relationships" do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe "#instance methods" do
    it "can get average years of experience" do

      expect(Mechanic.average_years_experience.round).to eq(10)
    end

    it "can get the names of rides that are neing working on" do

      expect(@jon.names_of_rides_working_on).to eq(["Merry Go Round"])
    end

    it "can order rides by thrill rating desc" do

      expect(@jon.thrill_rating_desc).to eq([@roller, @hammer])
    end
  end
end
