# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

require 'rails_helper'

RSpec.describe 'index page' do
  it "shows all of the mechanics names, years of experience, and the average experience across all mechanics" do

    mechanic_1 = Mechanic.create!(name: 'Ted', years_experience: 9)
    mechanic_2 = Mechanic.create!(name: 'Bob', years_experience: 11)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.years_experience)
    expect(page).to have_content(mechanic_2.years_experience)
    expect(page).to have_content("10 years of experience")
    
  end
end
