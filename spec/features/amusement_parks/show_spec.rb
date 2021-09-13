require 'rails_helper'

RSpec.describe 'the amusement park show page' do
  context 'when I visit an amusement park show page' do
    before(:each) do
      @speed_land = AmusementPark.create!(name: 'Speed Land', price_of_admission: 50)

      @frog_hop        = @speed_land.rides.create!(name: 'The Frog Hopper', thrill_rating: 2, open: true)
      @fahrenheit      = @speed_land.rides.create!(name: 'Fahrenheit', thrill_rating: 7, open: true)
      @kiss_raise      = @speed_land.rides.create!(name: 'The Kiss Raise', thrill_rating: 4, open: true)
      @lightning_racer = @speed_land.rides.create!(name: 'Lightning Racer', thrill_rating: 9, open: false)
      @storm_runner    = @speed_land.rides.create!(name: 'Storm Runner', thrill_rating: 8, open: false)
      @great_bear      = @speed_land.rides.create!(name: 'The Great Bear', thrill_rating: 6, open: true)

      visit "/amusement_parks/#{@speed_land.id}"
    end

    it 'has the name and price of admission' do
      expect(page).to have_content('Speed Land')
      expect(page).to have_content('Admissions: $50.00')
    end

    it 'has the average thrill rating of all rides' do
      expect(page).to have_content('Average Thrill Rating of Rides: 6.0/10')
    end
  end
end
