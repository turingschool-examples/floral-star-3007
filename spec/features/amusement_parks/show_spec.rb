require 'rails_helper'

RSpec.describe 'amusement park show page' do

  it 'shows that parks name and admission price' do
    park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)

    visit "/amusement_parks/#{park.id}"

    expect(page).to have_content(park.name)
    expect(page).to have_content(park.price_of_admission)
  end

  it 'shows the rides in that park in alphabetical order' do
    park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
    ride_1 = park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
    ride_2 = park.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: true)
    ride_3 = park.rides.create!(name: "Boomerang", thrill_rating: 9, open: true)

    visit "/amusement_parks/#{park.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
  end

  it 'shows the average thrill rating of its rides' do
    park = AmusementPark.create!(name: "Six Flags", price_of_admission: 30)
    ride_1 = park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
    ride_2 = park.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: true)
    ride_3 = park.rides.create!(name: "Boomerang", thrill_rating: 9, open: true)

    visit "/amusement_parks/#{park.id}"

    expect(page).to have_content(9)
  end
end
