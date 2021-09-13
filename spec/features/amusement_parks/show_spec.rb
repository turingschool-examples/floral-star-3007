require 'rails_helper'

RSpec.describe "amusement park show page" do
  it 'displays the name of the park and the price of admission' do
    hpw = AmusementPark.create!(name: "Harry Potter World", price_of_admission: 20)
    ride1 = hpw.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
    ride2 = hpw.rides.create!(name: "Tea Cups", thrill_rating: 3, open: false)
    ride3 = hpw.rides.create!(name: "Ferris Wheel", thrill_rating: 2, open: true)

    visit "/amusement_parks/#{hpw.id}"
  
    expect(page).to have_content(hpw.name)
    expect(page).to have_content(hpw.price_of_admission)
  end

  it 'lists rides rides alphabetically' do
    hpw = AmusementPark.create!(name: "Harry Potter World", price_of_admission: 20)
    ride1 = hpw.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
    ride2 = hpw.rides.create!(name: "Tea Cups", thrill_rating: 3, open: false)
    ride3 = hpw.rides.create!(name: "Ferris Wheel", thrill_rating: 2, open: true)

    visit "/amusement_parks/#{hpw.id}"
    save_and_open_page

    expect(ride3.name).to appear_before(ride1.name)
    expect(ride1.name).to appear_before(ride2.name)
  end
end
