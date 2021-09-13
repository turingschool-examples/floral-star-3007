require 'rails_helper'

RSpec.describe "mechanic index page" do
  before :each do
    @martin = Mechanic.create!(name: "Mechanic Martin", years_experience: 25)
    @melvin = Mechanic.create!(name: "Mechanic Melvin", years_experience: 15)
    @mark = Mechanic.create!(name: "Mechanic Mark", years_experience: 10)
    @matt = Mechanic.create!(name: "Mechanic Matthew", years_experience: 10)

  end

  it 'has all mechanics, years experience and average years experience' do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@martin.name)
    expect(page).to have_content(@martin.years_experience)
    expect(page).to have_content(@melvin.name)
    expect(page).to have_content(@melvin.years_experience)
    expect(page).to have_content(@mark.name)
    expect(page).to have_content(@mark.years_experience)
    expect(page).to have_content(@matt.name)
    expect(page).to have_content(@matt.years_experience)
    expect(page).to have_content("Average years of experience: 15")
  end
end
