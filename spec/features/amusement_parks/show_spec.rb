require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before(:each) do
    #@kings = AmusementPark.create!(name: "Kings Island", price_of_admission: 50)
    @cp = AmusementPark.create!(name: "Cedar Point", price_of_admission: 60)
    @topthrill = Ride.create!(name: "Top Thrill Dragster", thrill_rating: 9, open: false, amusement_park: @cp)
    @maverick = Ride.create!(name: "Maverick", thrill_rating: 8, open: true, amusement_park: @cp)
    @millenium = Ride.create!(name: "Millenium Force", thrill_rating: 10, open: true, amusement_park: @cp)
  end

  it 'has park and attributes' do
    visit "/amusement_parks/#{@cp.id}"

    expect(page).to have_content(@cp.name)
    expect(page).to have_content(@cp.price_of_admission)
  end

  it 'has rides in alphabetical order' do
    visit "/amusement_parks/#{@cp.id}"

    within("#park-rides") do
      expect(page).to have_content(@topthrill.name)
      expect(page).to have_content(@maverick.name)
      expect(page).to have_content(@millenium.name)

      expect(@maverick.name).to appear_before(@millenium.name, only_text: true)
      expect(@millenium.name).to appear_before(@topthrill.name, only_text: true)
    end
  end

  xit 'has average thrill rating for park' do
    visit "/amusement_parks/#{@cp.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 9/10")
  end
end
