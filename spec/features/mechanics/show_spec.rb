require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
    describe 'display' do

        before :each do
            mech = Mechanic.create!({name: "Dog", years_experience: 4})
            park = AmusementPark.create!({name: "Funky Town", price_of_admission: 10})
            ride_1 = park.rides.create!({name: "fucker", thrill_rating: 4, open: false})
            pair = MechanicRide.create!({mechanic_id: mech.id, ride_id: ride_1.id})

            visit("/mechanics/#{mech.id}")
        end

        it 'can display mechanic and its attributtes' do
            expect(page).to have_content("Dog")
            expect(page).to have_content("4")
            expect(page).to have_content("Dog")
        end
    end
end