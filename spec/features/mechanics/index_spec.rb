require 'rails_helper'

RSpec.describe 'mechanics index page' do

  before :each do
    mechanic_1 = Mechanic.create!(name: "Manny", experience: 10)
    mechanic_2 = Mechanic.create!(name: "Moe", experience: 15)
    mechanic_3 = Mechanic.create!(name: "Jack", experience: 20)
  end

  it "lists all mechanic names on the index page" do
    visit "/mechanics"
    expect(page).to have_content("Manny")
    expect(page).to have_content("Moe")
    expect(page).to have_content("Jack")

    expect(page).to have_content("Years Experience: 10")
    expect(page).to have_content("Years Experience: 15")
    expect(page).to have_content("Years Experience: 20")

    expect(page).to have_content("Average Experience: 15")
  end
end
