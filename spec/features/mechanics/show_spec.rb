# Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

require 'rails_helper'

RSpec.describe 'Mechanics#showpage' do
  before(:each) do
    # @kk = AmusementPark.create!(name: 'Kentucky Kingdom', price: 30)
    @mj = Mechanic.create!(name: 'Malloy Johnson', years_experience: 4)
    @st = Mechanic.create!(name: 'Stephen Thompson', years_experience: 10)

    @gut_spiller = Ride.create!(name: 'Gut Spiller', thrill_rating: 7, open: false)
    @ferris_wheel = Ride.create!(name: 'Shut Your Eyes', thrill_rating: 3, open: true)
    @batman = Ride.create!(name: 'Batman', thrill_rating: 8, open: true)
    @beast = Ride.create!(name: 'Son Of Beast', thrill_rating: 6, open: false)

    RidesMechanic.create!(mechanic: @mj, ride: @gut_spiller)
    RidesMechanic.create!(mechanic: @mj, ride: @ferris_wheel)
    RidesMechanic.create!(mechanic: @mj, ride: @beast)
  end

  it 'can display the mechanics attributes' do
    visit "/mechanics/#{@mj.id}"

    expect(page).to have_content(@mj.name)
    expect(page).to have_content(@mj.years_experience)
    expect(page).to not_have_content(@st.name)
  end
end
