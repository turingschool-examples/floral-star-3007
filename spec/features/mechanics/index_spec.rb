require 'rails_helper'

RSpec.describe 'the mechanics index page' do

    before :each do
      @mech_1 = Mechanic.create!(name: "Bob", years_experience: 7)
      @mech_2 = Mechanic.create!(name: "Jenny", years_experience: 12)
    end


  it "displays all mechanics with attributes" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")

    within("#mechanic-#{@mech_1.id}") do
      expect(page).to have_content("Bob")
      expect(page).to have_content("7 years of experience")
    end

    within("#mechanic-#{@mech_2.id}") do
      expect(page).to have_content("Jenny")
      expect(page).to have_content("12 years of experience")
    end
  end

  it "displays the average years of experience for all mechanics" do
    visit '/mechanics'

    within('#stats') do
      expect(page).to have_content("Average Experience: 9.5 years")
    end
  end
end
