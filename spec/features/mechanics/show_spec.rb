require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
    describe 'display' do

        before :each do
            mech = Mechanic.create!({name: "Dog", years_experience: 4})
            park = AmusementPark.create!({name: "Funky Town", price_of_admission: 10})
            ride_1 = park.rides.create!({name: "fucker", thrill_rating: 4, open: true})
            ride_2 = park.rides.create!({name: "zingo", thrill_rating: 3, open: true})
            ride_3 = park.rides.create!({name: "dingus", thrill_rating: 5, open: true})
            pair_1 = MechanicRide.create!({mechanic_id: mech.id, ride_id: ride_1.id})
            pair_2 = MechanicRide.create!({mechanic_id: mech.id, ride_id: ride_2.id})

            visit("/mechanics/#{mech.id}")
        end

        it 'can display mechanic and its attributtes' do
            expect(page).to have_content("Dog")
            expect(page).to have_content("4")
        end

        it 'can display rides if only they are open and also ordered by thrill rating accending order' do
            expect("zingo").to appear_before("fucker")
        end

        it 'has a button to add a mechanic to a ride' do
            fill_in("Assign Ride", with: 3)
            click_button "Assign Ride"

            expect(current_path).to eq("/mechanics/#{mech.id}")
        end

    end
end