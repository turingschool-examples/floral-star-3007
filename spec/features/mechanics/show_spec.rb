require 'rails_helper'

describe 'mechanics show page' do
  before(:each) do
    @khoi = Mechanic.create!(name: "Khoi", experience: 5)
    @park = AmusementPark.create!(name: "Park of Amusement", price_of_admission: 80)
    @ride_1 = @park.rides.create!(name: "Nice Ride", thrill_rating: 10, open: true)
    @ride_2 = @park.rides.create!(name: "Another Nice Ride", thrill_rating: 8, open: false)
    @ride_3 = @park.rides.create!(name: "The Last Nice Ride", thrill_rating: 7, open: true)
    @ride_4 = @park.rides.create!(name: "The Real Last Nice Ride", thrill_rating: 9, open: true)
    RideMechanic.create!(ride: @ride_1, mechanic: @khoi)
    RideMechanic.create!(ride: @ride_2, mechanic: @khoi)
    RideMechanic.create!(ride: @ride_3, mechanic: @khoi)

    visit "/mechanics/#{@khoi.id}"
  end
  
  it 'lists mechanic name, exp, and rides currently working on' do
    expect(page).to have_content(@khoi.name)
    expect(page).to have_content(@khoi.experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to_not have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
    expect(@ride_1.name).to appear_before(@ride_3.name)
  end

  it 'has a form to add a ride to workload' do
    fill_in :ride_id, with: "#{@ride_4.id}"
    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{@khoi.id}")
    expect(page).to have_content(@ride_4.name)
    expect(@ride_4.name).to appear_before(@ride_3.name)
  end
end