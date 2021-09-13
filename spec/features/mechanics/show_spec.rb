require 'rails_helper'

RSpec.describe 'mechanic show page' do
  it 'display mechanic name, years experience, and name of all open rides working on ordered by thrill' do
    hpw = AmusementPark.create!(name: "Harry Potter World", price_of_admission: 20)
    mechanic1 = Mechanic.create!(name: "Gypsy", years_of_experience: 15)
    ride1 = hpw.rides.create!(name: "Ferris Wheel", thrill_rating: 2, open: true)
    ride2 = hpw.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
    ride3 = hpw.rides.create!(name: "Tea Cups", thrill_rating: 3, open: false)
    RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)
    RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic1.id)
    RideMechanic.create!(ride_id: ride3.id, mechanic_id: mechanic1.id)

    visit "/mechanics/#{mechanic1.id}"
    save_and_open_page

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_of_experience)
    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(ride2.name).to appear_before(ride1.name)
    expect(page).to_not have_content(ride3.name)
  end
end
