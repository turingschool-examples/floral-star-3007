require 'rails_helper'

RSpec.describe "mechanics show page" do
  before :each do
    @park = AmusementPark.create!(name: "Universal", price_of_admission: 120)
    @m1 = Mechanic.create!(name: "George", years_of_experience: 7)
    @m2 = Mechanic.create!(name: "Alison", years_of_experience: 5)
    @m3 = Mechanic.create!(name: "Gary", years_of_experience: 2)
    @m4 = Mechanic.create!(name: "Georgina", years_of_experience: 10)
    @r1 = @park.rides.create!(name: "The Hulk", thrill_rating: 7, open: true)
    @r2 = @park.rides.create!(name: "Hogwarts Castle", thrill_rating: 6, open: true)
    @r3 = @park.rides.create!(name: "Dueling Dragons", thrill_rating: 8, open: false)
    @r4 = @park.rides.create!(name: "Spiderman", thrill_rating: 4, open: true)
    RideMechanic.create!(mechanic: @m1, ride:@r1)
    RideMechanic.create!(mechanic: @m1, ride:@r2)
    RideMechanic.create!(mechanic: @m1, ride:@r3)
    RideMechanic.create!(mechanic: @m2, ride:@r1)
    RideMechanic.create!(mechanic: @m2, ride:@r4)
    RideMechanic.create!(mechanic: @m3, ride:@r1)
    RideMechanic.create!(mechanic: @m3, ride:@r4)

  end

  it 'has mechanic info' do
    visit "/mechanics/#{@m1.id}"
    expect(page).to have_content(@m1.name)
    expect(page).to have_content(@m1.years_of_experience)
    expect(["'The Hulk', 'Hogwarts Castle'"])

    visit "/mechanics/#{@m3.id}"
    expect(page).to have_content(@m3.name)
    expect(page).to have_content(@m3.years_of_experience)
    expect(["'The Hulk', 'Spiderman'"])
  end

  it 'has a form to add ride to workload' do
    visit "/mechanics/#{@m1.id}"
save_and_open_page
    fill_in(:ride_id, with: @r3.id)
    click_button("Submit")
    expect(current_path).to eq("/ride_mechanic/#{@m1.id}")

    expect(page).to have_content(@r3.name)
  end
end
