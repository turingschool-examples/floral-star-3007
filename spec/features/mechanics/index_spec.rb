require 'rails_helper'

RSpec.describe 'mechanic index page' do
  it 'lists all of the mechanics names and years of experience and the average years experience' do
    mechanic1 = Mechanic.create!(name: "Gypsy", years_of_experience: 15)
    mechanic2 = Mechanic.create!(name: "Daisy", years_of_experience: 10)
    mechanic3 = Mechanic.create!(name: "Rosie", years_of_experience: 20)

    visit '/mechanics'
    save_and_open_page

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic3.name)
    expect(page).to have_content(mechanic3.years_of_experience)
    expect(page).to have_content(mechanic2.years_of_experience)
    expect(page).to have_content(mechanic1.years_of_experience)
    expect(page).to have_content("Average years of experience across all mechanics: 15.0")
  end
end
