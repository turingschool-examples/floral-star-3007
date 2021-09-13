require 'rails_helper'
# rspec spec/features/mechanics/show_spec.rb
RSpec.describe 'Mechanic Show Page' do
  before :each do
    @fun_park = AmusementPark.create!(name: "Fun Park", price_of_admission: 10)
    @best_ride = @fun_park.rides.create!(name: "Best Ride", thrill_rating: 2, open: true)
    @scariest_ride = @fun_park.rides.create!(name: "Scariest Ride", thrill_rating: 10, open: true)
    @closed_ride = @fun_park.rides.create!(name: "Closed Ride", thrill_rating: 6, open: false)
    @sara = Mechanic.create!(name: "Sara", experience: 20)
    @fred = Mechanic.create!(name: "Fred", experience: 10)

  end
  describe 'display mechanics attributes and rides their working on' do
    it 'has name, years of experience, name of rides working on' do
      visit mechanic_path(@sara)

      MechanicRide.create!(ride: @best_ride, mechanic: @sara)
      MechanicRide.create!(ride: @scariest_ride, mechanic: @sara)
      MechanicRide.create!(ride: @closed_ride, mechanic: @sara)

      expect(page).to have_content(@sara.name)
      expect(page).to have_content(@sara.experience)
      expect(@sara.rides).to eq([@best_ride, @scariest_ride, @closed_ride])
    end

    it 'only shows open rides' do

    end

    it 'lists the rides by desc thrill rating' do
      # And the rides are listed by thrill rating in descending order (most thrills first)
    end
  end
end
