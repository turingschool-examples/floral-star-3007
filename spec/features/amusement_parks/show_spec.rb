# spec/features/amusement_parks/show_spec.rb
require 'rails_helper'

RSpec.describe 'the amusement park show page' do
  before(:each) do
    @park1 = AmusementPark.create!(name: "State Fair", price_of_admission: 12)
    @ride1 = Ride.create!(name: "The Mangler", thrill_rating: 6, open: true, amusement_park_id: @park1.id)
    @ride2 = Ride.create!(name: "Puke-A-Thon", thrill_rating: 8, open: true, amusement_park_id: @park1.id)
    @ride3 = Ride.create!(name: "Topsy Scurvy", thrill_rating: 3, open: false, amusement_park_id: @park1.id)
    @ride4 = Ride.create!(name: "Pioneer Railroad", thrill_rating: 1, open: true, amusement_park_id: @park1.id)
    @ride5 = Ride.create!(name: "Goldpanner Challenge", thrill_rating: 2, open: true, amusement_park_id: @park1.id)
  end

  it "lists the name of park and price of admission" do
    visit amusement_park_path(@park1)

    expect(page).to have_content(@park1.name)
    expect(page).to have_content(@park1.price_of_admission)
    expect(page).to have_content("$12.00")
  end

  it "lists the park's rides' names in alphabetical order" do
    visit amusement_park_path(@park1)

    expect(@ride5.name).to appear_before(@ride1.name)
    expect(@ride4.name).to appear_before(@ride2.name)
  end

  it "shows the average thrill rating of the rides" do
    visit amusement_park_path(@park1)
  save_and_open_page
    expect(page).to have_content("Average Thrill Rating: 4")
  end
end
