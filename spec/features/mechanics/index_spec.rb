require "rails_helper"

RSpec.describe "Mechanics Index Page" do
  describe 'user story 1' do
    it "displays information" do
      mechanic_1 = Mechanic.create!(name: "Kevin", years_of_experience: 11)
      mechanic_2 = Mechanic.create!(name: "Marcy", years_of_experience: 25)
      mechanic_3 = Mechanic.create!(name: "Bob", years_of_experience: 2)
      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_3.name)
      expect(page).to have_content(mechanic_1.years_of_experience)
      expect(page).to have_content(mechanic_2.years_of_experience)
      expect(page).to have_content(mechanic_3.years_of_experience)
    end

    it "displays average age of all mechanics" do
      mechanic_1 = Mechanic.create!(name: "Kevin", years_of_experience: 11)
      mechanic_2 = Mechanic.create!(name: "Marcy", years_of_experience: 25)
      mechanic_3 = Mechanic.create!(name: "Bob", years_of_experience: 2)
      visit "/mechanics"

      expect(page).to have_content(12.67)
    end
  end
end
