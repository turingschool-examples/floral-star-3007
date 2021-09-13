require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Joe', years_experience: 10)
    @mechanic2 = Mechanic.create!(name: 'Jan', years_experience: 5)
    @park1 = AmusementPark.create!(name: 'Funtown', price_of_admission: 50.00)
    @park2 = AmusementPark.create!(name: 'Splashtown', price_of_admission: 70.00)
    @ride1 = @mechanic1.rides.create!(name: 'Alpine Swing', thrill_rating: '10', open: true, amusement_park_id: @park1.id)
    @ride2 = @mechanic1.rides.create!(name: 'Slide', thrill_rating: '20', open: true, amusement_park_id: @park1.id)
    @ride3 = @mechanic1.rides.create!(name: 'Bumper Cars', thrill_rating: '35', open: true, amusement_park_id: @park1.id)
    @ride4 = Ride.create!(name: 'Coaster', thrill_rating: '25', open: true, amusement_park_id: @park2.id)
    visit "/amusement_parks/#{@park1.id}"
  end

  it 'shows park attributes' do
    expect(page).to have_content(@park1.name)
    expect(page).to have_content('$50.00')
    expect(page).to_not have_content(@park2.name)
    expect(page).to_not have_content('$70.00')
  end

  it 'shows name of all rides at park alphabetically' do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to_not have_content(@ride4.name)
    expect(@ride1.name).to appear_before(@ride3.name)
    expect(@ride3.name).to appear_before(@ride2.name)
  end

  it 'shows average thrill rating' do
    expect(page).to have_content(21.7)
  end
end
