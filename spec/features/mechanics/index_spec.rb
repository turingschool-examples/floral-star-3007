require 'rails_helper'
# rspec spec/features/mechanics/index_spec.rb
RSpec.describe 'Mechanic Index Page' do
  describe 'display all mechanics and their attributes' do
    it 'lists all mechanics and their attributes' do
      fun_park = AmusementPark.create!(name: "Fun Park", price_of_admission: 10)
      best_ride = fun_park.rides.create!(name: "Best Ride", thrill_rating: 2, open: true)
      sara = Mechanic.create!(name: "Sara", experience: 13)
      fred = Mechanic.create!(name: "Fred", experience: 13)

      visit mechanics_path

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(sara.name)
      expect(page).to have_content(sara.experience)
      expect(page).to have_content(fred.name)
      expect(page).to have_content(fred.experience)
    end
  end

  describe 'display average years of experience' do
    it 'calcs the average years of experience across all mechanics' do
    end
  end
end
