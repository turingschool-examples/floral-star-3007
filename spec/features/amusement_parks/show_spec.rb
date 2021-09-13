require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do
  describe 'extension work' do
    it "shows amusement park information" do
      six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
      mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
      ride_1 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 40, open: true, amusement_park_id: six_flags.id)
      ride_2 = mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 200, open: false, amusement_park_id: six_flags.id)
      ride_3 = mechanic_1.rides.create!(name: 'Blade', thrill_rating: 100, open: true, amusement_park_id: six_flags.id)

      visit "amusement_parks/#{six_flags.id}"

      expect(page).to have_content(six_flags.name)
      expect(page).to have_content(six_flags.price_of_admission)
    end

    it "shows amusement park information" do
      six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
      mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
      ride_1 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 40, open: true, amusement_park_id: six_flags.id)
      ride_2 = mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 200, open: false, amusement_park_id: six_flags.id)
      ride_3 = mechanic_1.rides.create!(name: 'Blade', thrill_rating: 100, open: true, amusement_park_id: six_flags.id)

      visit "amusement_parks/#{six_flags.id}"

      expect(page).to have_content(six_flags.name)
      expect(page).to have_content(six_flags.price_of_admission)
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
    end

    it "shows average thrill rating of all the rides" do
      six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
      mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
      ride_1 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true, amusement_park_id: six_flags.id)
      ride_2 = mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 2, open: false, amusement_park_id: six_flags.id)
      ride_3 = mechanic_1.rides.create!(name: 'Blade', thrill_rating: 10, open: true, amusement_park_id: six_flags.id)

      visit "amusement_parks/#{six_flags.id}"

      expect(page).to have_content("Average Thrill Rating of Rides: 5.33/10")
    end
  end
end
