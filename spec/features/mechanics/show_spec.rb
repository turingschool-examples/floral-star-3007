require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  before :each do
    @park_1 = AmusementPark.create!(name: "Six Flags", price_of_admission: 5)
    @ride_1 = @park_1.rides.create!(name: "Twister", thrill_rating: 4, open: true)
    @ride_2 = @park_1.rides.create!(name: 'Slingshot', thrill_rating:5, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Bumper cars', thrill_rating:2, open:false)
    @kara = Mechanic.create!(name: 'Kara Smith', years_experience:3)
    @sam = Mechanic.create!(name: 'Sam Adams', years_experience:2)
    @kara.rides << [@ride_1, @ride_2]
    @sam.rides << [@ride_1, @ride_3]
  end

  it 'shows mechanic attributes and all rides they are working on' do
    visit "/mechanics/#{@kara.id}"

    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to_not have_content(@ride_3.name)
  end

  it 'only shows rides that are open' do
    visit "/mechanics/#{@sam.id}"
    expect(page).to have_content(@sam.name)
    expect(page).to have_content(@sam.years_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to_not have_content(@ride_2.name)
    expect(page).to_not have_content(@ride_3.name)
  end
end
