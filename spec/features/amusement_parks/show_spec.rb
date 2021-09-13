require 'rails_helper'

RSpec.describe 'amusement park show' do
  let!(:park)  { AmusementPark.create(name: 'Six Flags', price_of_admission: 20) }
  let!(:ride1) { park.rides.create!(name: '2F2F', thrill_rating: 6, open: true) }
  let!(:ride2) { park.rides.create!(name: 'Splash Town', thrill_rating: 2, open: false) }
  let!(:ride3) { park.rides.create!(name: 'Bungie Jump', thrill_rating: 10, open: true) }

  before :each do
    visit amusement_park_path(park)
  end

  it 'has the park name, admission price, average thrill rating' do
    expect(page).to have_content(park.name)
    expect(page).to have_content("$20.00")
    expect(page).to have_content(park.average_thrill_rating)
  end

  it 'has its rides in alphabetical order' do
    expect(ride1.name).to appear_before(ride3.name, only_text: true)
    expect(ride3.name).to appear_before(ride2.name, only_text: true)
  end
end

