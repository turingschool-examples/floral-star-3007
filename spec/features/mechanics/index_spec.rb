require 'rails_helper'

RSpec.describe 'Mechanic index page' do
  before :each do
    @park_1 = AmusementPark.create!(name: "Six Flags", price_of_admission: 5)
    @ride_1 = @park_1.rides.create!(name: "Twister", thrill_rating: 4, open: true)
    @ride_2 = @park_1.rides.create!(name: 'Slingshot', thrill_rating:5, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Bumper cars', thrill_rating:2, open:false)
    @kara = Mechanic.create!(name: 'Kara Smith', years_experience:3)
    @sam = Mechanic.create!(name: 'Sam Adams', years_experience:2)
  end

  it ' displays the mechanics attributes' do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_experience)
    expect(page).to have_content(@sam.name)
    expect(page).to have_content(@sam.years_experience)
  end

  it 'displays the average years of experience accross all mechanics' do
    visit "/mechanics"
    expect(page).to have_content("Average years of experience:#{Mechanic.average_years}")
  end
end
