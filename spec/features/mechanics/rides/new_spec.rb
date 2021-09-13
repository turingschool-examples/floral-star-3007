require 'rails_helper'

RSpec.describe "New ride work" do

  it 'has a button to add a new ride to workload' do

  m1 = Mechanic.create!(name: "George", years_of_experience: 7)

      visit "/mechanics/#{m1.id}"

      click_button("Add ride to workload")
  end

  it 'can create a new ride to add to workload' do
    m1 = Mechanic.create!(name: "George", years_of_experience: 7)

    visit "/mechanics/#{m1.id}/rides/new"
  end
end
