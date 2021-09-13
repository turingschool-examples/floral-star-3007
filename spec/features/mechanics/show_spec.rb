require 'rails_helper'

RSpec.describe 'the mechanics show page' do

  before :each do
    @mech_1 = Mechanic.create!(name: "Bob", years_experience: 7)

    @park = AmusementPark.create!(name: "Six Flags", price_of_admission: 75)

    @ride_1 = @park.rides.create!(name: "Kiddie Coaster", thrill_rating: 3, open: true)
    @ride_2 = @park.rides.create!(name: "Rollercoaster", thrill_rating: 7, open: true)
    @ride_3 = @park.rides.create!(name: "Swings", thrill_rating: 5, open: false)
  end

  it "displays all the mechanics attributes" do
    visit "/mechanics/#{@mech_1.id}"

    within('#attributes') do
      expect(page).to have_content("Bob")
      expect(page).to have_content("7 years of experience")
    end
  end

  it "shows all mechanics open rides ordered by thrill desc" do
    visit "/mechanics/#{@mech_1.id}"

    within('#rides') do
      expect(page).to have_content('Kiddie Coaster')
      expect(page).to have_content('Rollercoaster')
      expect(page).to_not have_content('Swings')

      expect('Rollercoaster').to appear_before('Kiddie Coaster')
    end
  end
end
