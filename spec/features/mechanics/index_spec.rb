require 'rails_helper'

RSpec.describe 'mechanics index page' do

  before :each do
    @mechanic_1 = Mechanic.create!(name: "Manny", experience: 10)
    @mechanic_2 = Mechanic.create!(name: "Moe", experience: 15)
    @mechanic_3 = Mechanic.create!(name: "Jack", experience: 20)
  end

  it "lists all mechanic names on the index page" do
    visit "/mechanics"
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_3.name)

    expect(page).to have_content("Years Experience: #{@mechanic_1.experience}")
    expect(page).to have_content("Years Experience: #{@mechanic_2.experience}")
    expect(page).to have_content("Years Experience: #{@mechanic_3.experience}")

    expect(page).to have_content("Average Experience: #{Mechanic.average_experience}")
  end
end
