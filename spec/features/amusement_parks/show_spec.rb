require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before :each do
    @park         = AmusementPark.create!(name: "Busch Gardens", price_of_admission: 50)
    @twister      = @park.rides.create!(name: "Twister", thrill_rating: 10, open: true)
    @boggler      = @park.rides.create!(name: "Boggler", thrill_rating: 7, open: true)
    @river_cruise = @park.rides.create!(name: "River Cruise", thrill_rating: 1, open: true)
    @dare_devil   = @park.rides.create!(name: "Daredevil", thrill_rating: 10, open: false)
  end

  it 'Shows the name and price of admission for the amusement park' do
    visit "/amusement_parks/#{@park.id}"
    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.price_of_admission)
  end

  it 'shows the names of all the rides at the park in alphabetical_sort' do
    visit "/amusement_parks/#{@park.id}"

    expect(@boggler.name).to appear_before(@dare_devil.name)
    expect(@dare_devil.name).to appear_before(@river_cruise.name)
    expect(@river_cruise.name).to appear_before(@twister.name)
  end

  it 'shows the average thrill rating for the park' do


    visit "/amusement_parks/#{@park.id}"
save_and_open_page
    expect(page).to have_content(7.0)
  end
end
