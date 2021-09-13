require 'rails_helper'


RSpec.describe 'Create action in mechanic rides' do
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

  it 'Creates for the correct ride and mechanic' do
    visit "mechanics/#{@mechanic_2.id}"
    fill_in "Ride id", with: @river_cruise.id
    click_button "Submit"

    expect(MechanicRide.last.mechanic).to eq(@mechanic_2)
    expect(MechanicRide.last.ride).to eq(@river_cruise)
  end

end
