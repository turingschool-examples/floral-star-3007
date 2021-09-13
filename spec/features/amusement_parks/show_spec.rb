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

      @speed     = Mechanic.create!(name: 'Speed Racer', years_experience: 5)
      @trixie    = Mechanic.create!(name: 'Trixie',      years_experience: 4)
      @chimchim  = Mechanic.create!(name: 'Chim-Chim',   years_experience: 2)

      @speed.rides << @frog_hop
      @speed.rides << @kiss_raise
      @speed.rides << @fahrenheit
      @speed.rides << @lightning_racer

      visit "/amusement_parks/#{@speed_land.id}"
    end

    it 'has the name and price of admission' do
      expect(page).to have_content('Speed Land')
      expect(page).to have_content('Price of Admission: $50')
    end
  end
end

# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
