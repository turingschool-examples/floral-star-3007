require "rails_helper"


RSpec.describe 'park show page' do

  it 'extension' do
    park = AmusementPark.create!(name: 'Yada Thrills', price_of_admission: 4)
    ride1 = park.rides.create!(name: 'Hurler', thrill_rating: 10, open: true)
    ride2 = park.rides.create!(name: 'Tosser', thrill_rating: 5, open: true)
    ride3 = park.rides.create!(name: 'Lazy', thrill_rating: 1, open: true)

    visit "/amusement_parks/#{park.id}"

    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(page).to have_content(ride3.name)

    expect(ride1.name).to appear_before(ride2.name)
    expect(ride1.name).to appear_before(ride3.name)
    expect(ride3.name).to appear_before(ride2.name)

    expect(page).to have_content("average thrill rating: 5.33")
  end


end
