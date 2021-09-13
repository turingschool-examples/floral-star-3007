require 'rails_helper'

describe 'amusement park show page' do
  before(:each) do
    @park = AmusementPark.create!(name: "Park of Amusement", price_of_admission: 80)
    @ride_1 = @park.rides.create!(name: "Nice Ride", thrill_rating: 10, open: true)
    @ride_2 = @park.rides.create!(name: "Another Nice Ride", thrill_rating: 8, open: false)
    @ride_3 = @park.rides.create!(name: "The Last Nice Ride", thrill_rating: 7, open: true)
    @ride_4 = @park.rides.create!(name: "The Real Last Nice Ride", thrill_rating: 9, open: true)

    visit "/amusement_parks/#{@park.id}"
  end
  
  it 'lists park information, rides, and average thrill rating' do
    save_and_open_page
    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.price_of_admission)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
    expect(page).to have_content(8.5)
  end
end