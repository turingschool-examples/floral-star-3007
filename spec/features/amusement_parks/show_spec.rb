require 'rails_helper'

RSpec.describe 'the amusement parks show page' do

  before :each do
    @park = AmusementPark.create!(name: "Six Flags", price_of_admission: 75)

    @ride_1 = @park.rides.create!(name: "Rollercoaster", thrill_rating: 7, open: true)
    @ride_2 = @park.rides.create!(name: "Kiddie Coaster", thrill_rating: 3, open: true)
    @ride_3 = @park.rides.create!(name: "Swings", thrill_rating: 5, open: false)
    @ride_4 = @park.rides.create!(name: "Tower Drop", thrill_rating: 9, open: true)
  end

  it "displays all the parks attributes" do
    visit "/amusement_parks/#{@park.id}"

    within('#attributes') do
      expect(page).to have_content("Six Flags")
      expect(page).to have_content("Admission: $75.00")
    end
  end

  it "displays all the parks rides in alphabetical order" do
    visit "/amusement_parks/#{@park.id}"

    within('#rides') do
      expect(page).to have_content("Rides:")

      expect('Kiddie Coaster').to appear_before('Rollercoaster')
      expect('Rollercoaster').to appear_before('Swings')
      expect('Swings').to appear_before('Tower Drop')
    end
  end

  it "shows the average thrill raing for every ride in the park" do
    visit "/amusement_parks/#{@park.id}"

    within('#average') do
      expect(page).to have_content("Average Thrill Rating of Rides: 6/10")
    end
  end
end
