require "rails_helper"

RSpec.describe 'mechanic show page' do

  it 'story 2' do
    mech = Mechanic.create!(name: "Janet", years_experience: 7)
    park = AmusementPark.create!(name: 'Yada Thrills', price_of_admission: 4)
    ride1 = park.rides.create!(name: 'Hurler', thrill_rating: 10, open: true)
    ride2 = park.rides.create!(name: 'Lazy', thrill_rating: 1, open: true)
    ride3 = park.rides.create!(name: 'Tosser', thrill_rating: 5, open: true)
    ride4 = park.rides.create!(name: 'Null', thrill_rating: 0, open: false)
    ride5 = park.rides.create!(name: 'Null2', thrill_rating: 0, open: true)

    mech.rides << ride1
    mech.rides << ride2
    mech.rides << ride3
    mech.rides << ride4

    visit "/mechanics/#{mech.id}"

    expect(page).to have_content(mech.name)
    expect(page).to have_content(mech.years_experience)
    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(page).to have_content(ride3.name)

    expect(page).to_not have_content(ride4.name)
    expect(page).to_not have_content(ride5.name)

    expect(ride1.name).to appear_before(ride2.name)
    expect(ride1.name).to appear_before(ride2.name)
    expect(ride3.name).to appear_before(ride2.name)
  end

  it 'story 3' do
    mech = Mechanic.create!(name: "Janet", years_experience: 7)
    park = AmusementPark.create!(name: 'Yada Thrills', price_of_admission: 4)
    ride1 = park.rides.create!(name: 'Hurler', thrill_rating: 10, open: true)
    ride2 = park.rides.create!(name: 'Lazy', thrill_rating: 1, open: true)

    visit "/mechanics/#{mech.id}"

    expect(page).to have_content("Add ride")

    fill_in('Add ride', with: @ride1.id)

    click 'submit'

    expect(current_path).to eq("/mechanics/#{mech.id}")
    expect(page).to have_content(ride1.name)
  end
end
