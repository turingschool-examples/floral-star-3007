require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
  before(:each) do
    @kara = Mechanic.create!(name: "Kara Johnson", yrs_xp: 12)
    @jamie = Mechanic.create!(name: "Jamie Marsh", yrs_xp: 5)
    @willie = Mechanic.create!(name: "Willie Walsh", yrs_xp: 32)
  end
  it 'displays mechanics and attributes' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")

    within("#mechanic-#{@kara.id}") do
      expect(page).to have_content(@kara.name)
      expect(page).to have_content(@kara.yrs_xp)
    end
    within("#mechanic-#{@jamie.id}") do
      expect(page).to have_content(@jamie.name)
      expect(page).to have_content(@jamie.yrs_xp)
    end
    within("#mechanic-#{@willie.id}") do
      expect(page).to have_content(@willie.name)
      expect(page).to have_content(@willie.yrs_xp)
    end
  end

  it 'displays average years for all mechanics' do
    visit '/mechanics'

    expect(page).to have_content("Average Years of Experience: 27.7")
  end
end
