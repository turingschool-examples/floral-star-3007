require 'rails_helper'

RSpec.describe 'the mechanics index page' do
  context 'when I visit the mechanics index page' do
    before(:each) do
      visit '/mechanics/'
    end

    it 'shows a header saying All Mechanics' do
      expect(page).to have_content('All Mechanics')
    end

    # it 'shows a ist of all mechanics names and their years of experience' do
    #
    # end
    #
    # it 'shows the average years of experience across all mechanics' do
    #
    # end
  end
end
