require 'rails_helper'

RSpec.describe 'mechanics show page' do

  it 'shows all mechanics and their info' do
    mechanic_1 = Mechanic.create!(name: "John", years_experience: 4)
    mechanic_2 = Mechanic.create!(name: "Sarah", years_experience: 6)

    visit "/mechanics"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.years_experience)
  end

  it 'shows the average years of experience across all mechanics' do
    mechanic_1 = Mechanic.create!(name: "John", years_experience: 4)
    mechanic_2 = Mechanic.create!(name: "Sarah", years_experience: 6)

    visit "/mechanics"

    expect(page).to have_content(5)
  end
end
