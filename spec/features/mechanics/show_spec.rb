require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Joe', years_experience: 10)
    @mechanic2 = Mechanic.create!(name: 'Jan', years_experience: 5)
    @park = AmusementPark.create!(name: 'Funtown', price_of_admission: 50.00)
    @ride1 = @mechanic1.rides.create!(name: 'Bathroom', thrill_rating: '10', open: true, amusement_park_id: @park.id)
    @ride2 = @mechanic1.rides.create!(name: 'Slide', thrill_rating: '20', open: true, amusement_park_id: @park.id)
    @ride3 = @mechanic1.rides.create!(name: 'Bumper Cars', thrill_rating: '30', open: true, amusement_park_id: @park.id)
    @ride4 = @mechanic1.rides.create!(name: 'Coaster', thrill_rating: '40', open: false, amusement_park_id: @park.id)
    @ride5 = Ride.create!(name: 'Ride 5', thrill_rating: '25', open: true, amusement_park_id: @park.id)
    visit "/mechanics/#{@mechanic1.id}"
  end

  it 'shows attributes' do
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_experience)
    expect(page).to_not have_content(@mechanic2.name)
  end

  it 'shows open rides for mechanic' do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to_not have_content(@ride4.name)
    expect(page).to_not have_content(@ride5.name)
  end

  it 'orders rides by rating' do
    expect(@ride3.name).to appear_before(@ride2.name)
    expect(@ride2.name).to appear_before(@ride1.name)
  end
end
