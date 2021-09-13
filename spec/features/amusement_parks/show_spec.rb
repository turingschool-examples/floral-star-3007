require "rails_helper"

RSpec.describe "AmusementPark Show Page" do
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

  describe "#Extension" do
    it "displays the name and price of admissions for that amusement park" do
      visit "/amusementparks/#{@six_flags.id}"

      expect(page).to have_content(@six_flags.name)
      expect(page).to have_content(@six_flags.price_of_admission)
    end

    it "displays the names of all the rides that are at that theme park listed in alphabetical order" do
      visit "/amusementparks/#{@six_flags.id}"

      expect(@hammer.name).to appear_before(@merry.name)
      expect(@merry.name).to appear_before(@roller.name)
    end

    it "displays the average thrill rating of the park's rides" do
      visit "/amusementparks/#{@six_flags.id}"

      expect(page).to have_content(5/10)
    end
  end

end
