# Story 1 - Mechanic Index Page

# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

require 'rails_helper'

RSpec.describe 'mechanics index page' do
  before(:each) do
    @mech_1 = Mechanic.create!(name: 'Joe', years_experience: 12)
    @mech_2 = Mechanic.create!(name: 'Sara', years_experience: 5)
    @mech_3 = Mechanic.create!(name: 'Frank', years_experience: 31)
  end

  it 'has a header' do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
  end

  it 'shows a list of all mechanics and years of experience' do
    visit "/mechanics"

    expect(page).to have_content(@mech_1.name)
    expect(page).to have_content(@mech_2.name)
    expect(page).to have_content(@mech_3.name)
    expect(page).to have_content(@mech_1.years_experience)
    expect(page).to have_content(@mech_2.years_experience)
    expect(page).to have_content(@mech_3.years_experience)
  end

  xit 'shows the average years of experience across all mechanics' do

  end
end