require 'rails_helper'

RSpec.describe 'mechanic index page' do
  before :each do
    @mech1 = Mechanic.create!(name: 'Jon', years_experience: 1)
    @mech2 = Mechanic.create!(name: 'Joe', years_experience: 4)
    @mech3 = Mechanic.create!(name: 'Jim', years_experience: 7)
    @mech4 = Mechanic.create!(name: 'Jan', years_experience: 10)
    visit "/mechanics"
  end

  it 'has a header' do
    within('h1') do
      expect(page).to have_content('All Mechanics')
    end
  end

  it 'shows all mechanic attributes' do
    expect(page).to have_content(@mech1.name)
    expect(page).to have_content(@mech1.years_experience)
    expect(page).to have_content(@mech2.name)
    expect(page).to have_content(@mech2.years_experience)
    expect(page).to have_content(@mech3.name)
    expect(page).to have_content(@mech3.years_experience)
  end

  it 'shows average years experience' do
    within('#avg') do
      expect(page).to have_content(5.5)
    end
  end
end
