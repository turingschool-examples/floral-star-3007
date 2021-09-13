require "rails_helper"

RSpec.describe 'mechanic index page' do


  it 'story 1' do
    mech1 = Mechanic.create!(name: "Bill", years_experience: 2)
    mech2 = Mechanic.create!(name: "Janet", years_experience: 7)


    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(mech1.name)
    expect(page).to have_content(mech1.years_experience)
    expect(page).to have_content(mech2.name)
    expect(page).to have_content(mech2.years_experience)
    expect(page).to have_content('average years of experience: 4.5')

  end
end
