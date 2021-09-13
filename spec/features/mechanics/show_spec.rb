require 'rails_helper'
# rspec spec/features/mechanics/show_spec.rb
RSpec.describe 'Mechanic Show Page' do
  before :each do
    @fun_park = AmusementPark.create!(name: "Fun Park", price_of_admission: 10)
    @best_ride = @fun_park.rides.create!(name: "Best Ride", thrill_rating: 2, open: true)
    @scariest_ride = @fun_park.rides.create!(name: "Scariest Ride", thrill_rating: 10, open: true)
    @sara = Mechanic.create!(name: "Sara", experience: 20)
    @fred = Mechanic.create!(name: "Fred", experience: 10)

  end
  describe 'display mechanics attributes and rides their working on' do
    it 'has name, years of experience, name of rides working on' do
      visit mechanic_path(@sara.id)

      @sara.rides << @best_ride
      @sara.rides << @scariest_ride
      # MechanicRide.create!(ride: @best_ride, mechanic: @sara)
      # MechanicRide.create!(ride: @scariest_ride, mechanic: @sara)

      expect(page).to have_content(@sara.name)
      expect(page).to have_content(@sara.experience)
      expect(page).to have_content(@best_ride.name)
      expect(page).to have_content("Best Ride")
      expect(page).to have_content("Scariest Ride")
    end

    it 'only shows open rides' do
      visit mechanic_path(@sara)
      @closed_ride = @fun_park.rides.create!(name: "Closed Ride", thrill_rating: 6, open: false)

      MechanicRide.create!(ride: @best_ride, mechanic: @sara)
      MechanicRide.create!(ride: @scariest_ride, mechanic: @sara)
      MechanicRide.create!(ride: @closed_ride, mechanic: @sara)

      expect(page).to have_content(@sara.name)
      expect(page).to have_content(@sara.experience)
      expect(@sara.rides.available).to eq([@best_ride, @scariest_ride])
    end

    it 'lists the rides by desc thrill rating' do
      expect(@scariest_ride.name).to appear_before(@best_ride.name)

      # And the rides are listed by thrill rating in descending order (most thrills first)
    end
  end
end
