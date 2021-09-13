require "rails_helper"

RSpec.describe "Mechanics Show Page" do
  describe 'user story 2' do
    it "displays information" do
      mechanic_1 = Mechanic.create!(name: "Kevin", years_of_experience: 11)

      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_of_experience)
      expect(page).to have_content("Rides Being Worked On:")
    end

    it "lists rides assigned to mechanic" do
      six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
      mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
      mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 40, open: true, amusement_park_id: six_flags.id)
      mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 100, open: false, amusement_park_id: six_flags.id)
      mechanic_1.rides.create!(name: 'The Blade', thrill_rating: 100, open: true, amusement_park_id: six_flags.id)

      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content("Years of Experience: #{mechanic_1.years_of_experience}")
      expect(page).to have_content("Ferris Wheel")
      expect(page).to have_content("The Blade")
      expect(page).to have_content(40)
      expect(page).to have_content(100)
    end

    it "only shows rides that are open and had them ordered by thrill rating in descending order" do
      six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 100)
      mechanic_1 = Mechanic.create!(name: 'Kevin Mugele', years_of_experience: 11)
      mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 40, open: true, amusement_park_id: six_flags.id)
      mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 200, open: false, amusement_park_id: six_flags.id)
      mechanic_1.rides.create!(name: 'The Blade', thrill_rating: 100, open: true, amusement_park_id: six_flags.id)

      visit "/mechanics/#{mechanic_1.id}"
      save_and_open_page

      expect(page).to have_content("Ferris Wheel")
      expect(page).to have_content("The Blade")
      expect(page).to have_content(40)
      expect(page).to have_content(100)
      expect(page).to_not have_content("Roller Coaster")
      expect(page).to_not have_content(200)
      expect(mechanic_1.rides.last.name).to appear_before(mechanic_1.rides.first.name)
    end
  end
end
