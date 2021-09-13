require "rails_helper"

# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

RSpec.describe "Mechanic Index Page" do
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

  describe "#Story 1" do
    it "displays a header saying 'All Mechanics'" do
      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
    end

    it "displays a list of all mechanic's names and their years of experience" do
      visit "/mechanics"

      expect(page).to have_content(@jon.name)
      expect(page).to have_content(@jon.years_experience)
      expect(page).to have_content(@kara.name)
      expect(page).to have_content(@kara.years_experience)
    end

    it "displays the average years of experience across all mechanics" do
      visit "/mechanics"

      expect(page).to have_content(9)
    end
  end
end
