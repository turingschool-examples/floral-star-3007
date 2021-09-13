require 'rails_helper'

RSpec.describe 'the mechanics index page' do
  context 'when I visit the mechanics index page' do
    before(:each) do
      @speed     = Mechanic.create!(name: 'Speed Racer', years_experience: 5)
      @trixie    = Mechanic.create!(name: 'Trixie',      years_experience: 4)
      @chimchim  = Mechanic.create!(name: 'Chim-Chim',   years_experience: 2)

      visit '/mechanics/'
    end

    it 'shows a header saying All Mechanics' do
      expect(page).to have_content('All Mechanics')
    end

    it 'shows a list of all mechanics names and their years of experience' do
      expect(page).to have_content('Speed Racer')
      expect(page).to have_content('Years of Experience: 5')
      expect(page).to have_content('Trixie')
      expect(page).to have_content('Years of Experience: 4')
      expect(page).to have_content('Chim-Chim')
      expect(page).to have_content('Years of Experience: 2')
    end

    # it 'shows the average years of experience across all mechanics' do
    #
    # end
  end
end
