require "rails_helper"

RSpec.describe "amusement park show page" do
  before :each do
    @ki = AmusementPark.create!(name: "King's Island", price_of_admission: 45)
    @beast = @ki.rides.create!(name: "The Beast", thrill_rating: 4, open: true)
    @diamond = @ki.rides.create!(name: "Diamond Back", thrill_rating: 5, open: true)
    @racers = @ki.rides.create!(name: "The Racers", thrill_rating: 2, open: false)
    @adventure = @ki.rides.create!(name: "Adventure Express", thrill_rating: 3, open: true)
    @swings = @ki.rides.create!(name: "Big Swings", thrill_rating: 1, open: true)
  end

  it 'has park name, price of admission, all rides listed alphabetically, average thrill rating for all rides' do
    visit "amusement_parks/#{@ki.id}"
    save_and_open_page
    expect(page).to have_content(@ki.name)
    expect(page).to have_content(@ki.price_of_admission)
    expect(page).to have_content(@beast.name)
    expect(page).to have_content(@diamond.name)
    expect(page).to have_content(@racers.name)
    expect(page).to have_content(@adventure.name)
    expect(page).to have_content(@swings.name)
    expect(page).to have_content(@ki.rides.average_thrill)
  end
end
