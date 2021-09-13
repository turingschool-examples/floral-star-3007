require 'rails_helper'
# rspec spec/features/mechanics/index_spec.rb
RSpec.describe 'Mechanic Index Page' do
  before :each do
    @sara = Mechanic.create!(name: "Sara", experience: 20)
    @fred = Mechanic.create!(name: "Fred", experience: 10)

    visit mechanics_path
  end
  describe 'display all mechanics and their attributes' do
    it 'lists all mechanics and their attributes' do
      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(@sara.name)
      expect(page).to have_content(@sara.experience)
      expect(page).to have_content(@fred.name)
      expect(page).to have_content(@fred.experience)
    end
  end

  describe 'display average years of experience' do
    it 'calcs the average years of experience across all mechanics' do
      expect(page).to have_content("Average years of experience: 15")
    end
  end
end
