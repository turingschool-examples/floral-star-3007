require 'rails_helper'

RSpec.describe 'mechanics show page' do
  before(:each) do
    @cp = AmusementPark.create!(name: "Cedar Point", price_of_admission: 60)
    @kara = Mechanic.create!(name: "Kara Johnson", yrs_xp: 12)
    @jamie = Mechanic.create!(name: "Jamie Marsh", yrs_xp: 5)
    @willie = Mechanic.create!(name: "Willie Walsh", yrs_xp: 32)
    @topthrill = Ride.create!(name: "Top Thrill Dragster", thrill_rating: 9, open: false, amusement_park: @cp)
    @maverick = Ride.create!(name: "Maverick", thrill_rating: 8, open: true, amusement_park: @cp)
    @millenium = Ride.create!(name: "Millenium Force", thrill_rating: 10, open: true, amusement_park: @cp)
  end

  it 'displays mechanic attributes and open rides' do
    @kara.rides << @maverick
    @kara.rides << @millenium
    @kara.rides << @topthrill
    visit "/mechanics/#{@kara.id}"

    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.yrs_xp)

    within("#rides") do
      expect(page).to have_content(@maverick.name)
      expect(page).to have_content(@millenium.name)
      expect(page).to_not have_content(@topthrill.name)

      expect(@millenium.name).to appear_before(@maverick.name, only_text: true)
    end
    expect(page).to_not have_content(@jamie.name)
    expect(page).to_not have_content(@willie.name)
  end

  it 'has form to add ride to mechanic' do
    visit "mechanics/#{@willie.id}"

    within("#rides") do
      expect(page).to_not have_content(@maverick.name)
    end
    expect(page).to have_content("Add a ride to workload:")
    within("#new-ride") do
      fill_in("Ride Id", with: "#{@maverick.id}")
      click_on "Add Ride"
    end

    expect(current_path).to eq("/mechanics/#{@willie.id}")
    within("#rides") do
      expect(page).to have_content(@maverick.name)
    end
  end
end
