# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

require 'rails_helper'

RSpec.describe 'the mechanic#index page' do
  before(:each) do
    @mj = Mechanic.create!(name: 'Malloy Johnson', years_experience: 5)
    @st = Mechanic.create!(name: 'Stephen Thompson', years_experience: 10)
  end

  it "can display all the mechanics attributes" do
    visit '/mechanics'

    expect(page).to have_content("#{@mj.name}")
    expect(page).to have_content("#{@mj.years_experience}")
    
  end
end
