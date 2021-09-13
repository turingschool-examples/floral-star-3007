# spec/features/mechanics/index_spec.rb
require 'rails_helper'

RSpec.describe 'the mechanics index page' do
  before(:each) do
    @mech1 = Mechanic.create!(name: "Ida Olson", years_experience: 14)
    @mech2 = Mechanic.create!(name: "Sarah Carter", years_experience: 10)
  end

  it "displays a list of mechanics, their names, and years of experience" do
    visit mechanics_path

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mech1.name)
    expect(page).to have_content(@mech1.years_experience)
    expect(page).to have_content(@mech2.name)
    expect(page).to have_content(@mech2.years_experience)
  end

  it "shows the average years experience of all mechanics" do
    visit mechanics_path

    expect(page).to have_content("14 years")
  end
end
