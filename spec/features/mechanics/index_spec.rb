require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do
    before :each do
        mech_1 = Mechanic.create!({name: "Dog", years_experience: 4})
        mech_2 = Mechanic.create!({name: "Bird", years_experience: 6})
        mech_3 = Mechanic.create!({name: "Squirel", years_experience: 20})

        visit("/mechanics")
    end
    describe 'display' do
        it 'has a header and all the mechanics and thier attributtes' do
            expect(page).to have_content("Dog")
            expect(page).to have_content("4")
            expect(page).to have_content("Bird")
            expect(page).to have_content("6")
            expect(page).to have_content("Squirel")
            expect(page).to have_content("20")
        end

        it 'has the average of all the years experice' do
            expect(page).to have_content("Average Years Experience: 10")
        end
    end
end