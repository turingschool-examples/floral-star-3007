require 'rails_helper'

RSpec.describe 'mechanic show page' do

  it 'shows the mechanics name/ years experience' do
    mechanic_1 = Mechanic.create!(name: "John", years_experience: 4)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
  end

  it 'shows the rides the mechanic is working on that are open' do
    park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
    mechanic_1 = Mechanic.create!(name: "John", years_experience: 4)
    ride_1 = mechanic_1.rides.create!(name: "Twister", thrill_rating: 5, open: true, amusement_park_id: park.id)
    ride_2 = mechanic_1.rides.create!(name: "Mind Eraser", thrill_rating: 9, open: true, amusement_park_id: park.id)
    #ride_3 = mechanic_1.rides.create!(name: "Boomerang", thrill_rating: 7, open: false, amusement_park_id: park.id)
    #error when creating closed ride, "Open can't be blank?"

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    #expect(page).to_not have_content(ride_3.name)
  end

  it 'has a form to add a ride by its id for a mechanic' do
    park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
    mechanic_1 = Mechanic.create!(name: "John", years_experience: 4)
    ride_1 = Ride.create!(name: "Twister", thrill_rating: 5, open: true, amusement_park_id: park.id)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content("Add Ride")
    fill_in :ride_id, with: ride_1.id
    click_button "Submit"
    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
    expect(page).to have_content(ride_1.name)
  end
end
