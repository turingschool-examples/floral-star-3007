require 'rails_helper'

describe 'mechanics index page' do
  before(:each) do
    @khoi = Mechanic.create!(name: "Khoi", experience: 5)
    @duy = Mechanic.create!(name: "Duy", experience: 3)
    @kathy = Mechanic.create!(name: "Kathy", experience: 4)
    visit "/mechanics"
  end
  
  it 'lists all mechanic names and years of exp' do
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@khoi.name)
    expect(page).to have_content(@duy.name)
    expect(page).to have_content(@kathy.name)
    expect(page).to have_content(4)
  end
end