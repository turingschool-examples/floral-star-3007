require 'rails_helper'

RSpec.describe 'Mechanic index', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Jason", years_of_experience: 15)
    @mechanic2 = Mechanic.create!(name: "Steven", years_of_experience: 7)
  end

  describe 'visit Mechanics index page' do
    it "lists all mechanics attributes, average experience & header" do
      visit('/mechanics')
      save_and_open_page
      expect(current_path).to eq("/mechanics")
      expect(page).to have_content("All Mechanics")
      expect(page).to have_content("Jason")
      expect(page).to have_content("Steven")
      expect(page).to have_content(15)
      expect(page).to have_content(7)
      # expect(page).to have_content(11)
    end
  end
end
