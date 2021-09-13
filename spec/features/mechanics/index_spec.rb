require 'rails_helper'
# rspec spec/features/mechanics/index_spec.rb
RSpec.describe 'Mechanic Index Page' do
  describe 'display all mechanics and their attributes' do
    it 'lists all mechanics and their attreibutes' do
      visit mechanics_path

      expect(page).to have_content("All Mechanics")
    end
  end
end
