require 'rails_helper'

RSpec.describe 'Mechanic show', type: :feature do
  before :each do
    @land_of_oz = AmusementPark.create!(name: 'Land of Oz', price_of_admission: 26)
    @mechanic1 = Mechanic.create!(name: "Jason", years_of_experience: 15)
    @mechanic2 = Mechanic.create!(name: "Steven", years_of_experience: 7)
    @ride1 = Ride.create!(amusement_park_id: @land_of_oz.id, name: 'Blizzard', thrill_rating: 15, open: true)
    @ride2 = Ride.create!(amusement_park_id: @land_of_oz.id, name: 'Bone Chiller', thrill_rating: 20, open: true)
    @ride3 = Ride.create!(amusement_park_id: @land_of_oz.id, name: 'Tingler', thrill_rating: 10, open: false)
    @mechanic1.rides << @ride1 << @ride2 << @ride3
  end

  describe 'visit Mechanic show page' do
    it 'lists attributes & only open ride working list' do
      visit("/mechanics/#{@mechanic1.id}")

      expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      expect(page).to have_content("Jason")
      expect(page).not_to have_content("Tingler")
      expect(@ride2.name).to appear_before(@ride1.name)
    end

    it 'can add a ride to a Mechanic' do
      visit("/mechanics/#{@mechanic2.id}")

      fill_in("Ride ID", with: @ride1.id)
      click_button('Submit')
      save_and_open_page
      expect(current_path).to eq("/mechanics/#{@mechanic2.id}")
      expect(page).to have_content(@ride1.name)
      expect(page).not_to have_content(@ride2.name)
      expect(page).not_to have_content(@ride3.name)
    end
  end
end
