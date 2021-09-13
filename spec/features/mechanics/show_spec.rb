require 'rails_helper'

RSpec.describe "mechanic show page" do
  before :each do
    @martin = Mechanic.create!(name: "Mechanic Martin", years_experience: 25)
    @ki = AmusementPark.create!(name: "King's Island", price_of_admission: 45)
    @beast = @ki.rides.create!(name: "The Beast", thrill_rating: 4, open: true)
    @diamond = @ki.rides.create!(name: "Diamond Back", thrill_rating: 5, open: true)
    @racers = @ki.rides.create!(name: "The Racers", thrill_rating: 2, open: false)
    @adventure = @ki.rides.create!(name: "Adventure Express", thrill_rating: 3, open: true)
    @drop = @ki.rides.create!(name: "Drop Zone", thrill_rating: 4, open: true)
    RideMechanic.create!(ride: @beast, mechanic: @martin)
    RideMechanic.create!(ride: @diamond, mechanic: @martin)
    RideMechanic.create!(ride: @racers, mechanic: @martin)
    RideMechanic.create!(ride: @adventure, mechanic: @martin)
  end

  it 'has mechanic name, years experience, and names of their rides(that are open, listed by thrill level)' do
    visit "/mechanics/#{@martin.id}"
    expect(page).to have_content(@martin.name)
    expect(page).to have_content(@martin.years_experience)
    expect(page).to have_content(@beast.name)
    expect(page).to have_content(@beast.thrill_rating)
    expect(page).to have_content(@diamond.name)
    expect(page).to have_content(@diamond.thrill_rating)
    expect(page).to have_content(@adventure.name)
    expect(page).to have_content(@adventure.thrill_rating)
    expect(page).not_to have_content(@racers.name)
    expect(page).not_to have_content("Thrill Rating: 2")
    expect(@diamond.name).to appear_before(@beast.name)
    expect(@beast.name).to appear_before(@adventure.name)
  end

  it 'has a form to add a ride to the mechanic, once submitted, redirects to show page with new ride info' do
    visit "/mechanics/#{@martin.id}"
    fill_in :ride_id, with: "#{@drop.id}"
    click_on "Submit"
    expect(current_path).to eq("/mechanics/#{@martin.id}")
    expect(page).to have_content(@drop.name)
    expect(page).to have_content(@drop.thrill_rating)
  end

end
