require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @park         = AmusementPark.create!(name: "Busch Gardens", price_of_admission: 50)
    @twister      = @park.rides.create!(name: "Twister", thrill_rating: 10, open: true)
    @boggler      = @park.rides.create!(name: "Boggler", thrill_rating: 7, open: true)
    @river_cruise = @park.rides.create!(name: "River Cruise", thrill_rating: 1, open: true)
    @dare_devil   = @park.rides.create!(name: "Daredevil", thrill_rating: 10, open: false)

    @mechanic_1 = Mechanic.create!(name: "Manny", experience: 10)
    @mechanic_2 = Mechanic.create!(name: "Moe", experience: 15)
    @mechanic_3 = Mechanic.create!(name: "Jack", experience: 20)

    MechanicRide.create!(mechanic: @mechanic_1, ride: @twister)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @boggler)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @river_cruise)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @dare_devil)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @twister)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @dare_devil)
  end

  it 'shows the mechanic name and years of experience' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content("Years Experience: #{@mechanic_1.experience}")
  end

  it 'shows the names of all open rides the mechanic is working on' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@twister.name)
    expect(page).to have_content(@boggler.name)
    expect(page).to have_content(@river_cruise.name)

    expect(page).to_not have_content(@dare_devil.name)
  end

  it 'sorts the rides by thrill rating in descending order' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(@twister.name).to appear_before(@boggler.name)
    expect(@boggler.name).to appear_before(@river_cruise.name)
  end

  it 'has a form to add a ride to a mechanics workload' do
    visit "/mechanics/#{@mechanic_2.id}"
    expect(page).to have_content("Add a Ride to #{@mechanic_2.name}'s Workload")
    expect(page).to have_content("Ride id")
    expect(page).to have_button("Submit")
  end

  it 'adds the ride to the mechanics ride list' do
    visit "/mechanics/#{@mechanic_2.id}"

    fill_in "Ride id", with: @river_cruise.id
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{@mechanic_2.id}")
    expect(page).to have_content(@river_cruise.name)
  end


end
