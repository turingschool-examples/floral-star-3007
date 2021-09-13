# spec/features/mechanics/show_spec.rb
require 'rails_helper'

RSpec.describe 'the mechanics show page' do
  before(:each) do
    @park = AmusementPark.create!(name: "State Fair", price_of_admission: 12.99)
    @mech1 = Mechanic.create!(name: "Ida Olson", years_experience: 14)
    @mech2 = Mechanic.create!(name: "Sarah Carter", years_experience: 10)
    @ride1 = Ride.create!(name: "The Mangler", thrill_rating: 6, open: true, amusement_park_id: @park.id)
    @ride2 = Ride.create!(name: "Puke-A-Thon", thrill_rating: 8, open: true, amusement_park_id: @park.id)
    @ride3 = Ride.create!(name: "Topsy Scurvy", thrill_rating: 3, open: false, amusement_park_id: @park.id)
  end

  it "shows the mechanic's name, years of experience, and the rides worked on" do
    @mech1.rides << @ride1

    visit mechanic_path(@mech1)

    expect(page).to have_content(@mech1.name)
    expect(page).to have_content(@mech1.years_experience)
    expect(page).to have_content(@ride1.name)
  end

  it "only shows the mechanics rides that are open" do
    @mech1.rides << @ride1
    @mech1.rides << @ride3

    visit mechanic_path(@mech1)

    expect(page).to have_content(@ride1.name)
    expect(page).to have_no_content(@ride3.name)
  end

  it "shows the rides by thrill rating it descending order" do
    @mech1.rides << @ride1
    @mech1.rides << @ride2

    visit mechanic_path(@mech1)

    expect(@ride2.name).to appear_before(@ride1.name)
  end
end
