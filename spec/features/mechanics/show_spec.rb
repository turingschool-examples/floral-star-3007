require 'rails_helper'

RSpec.describe 'mechanic show' do
  describe 'show page' do
    let!(:mech1) { Mechanic.create!(name: 'Steve', years_of_experience: 10) }

    before :each do
      visit mechanic_path(mech1)
    end

    it 'has the mechanics name and experience' do
      expect(page).to have_content(mech1.name)
      expect(page).to have_content(mech1.years_of_experience)
    end

    describe 'rides info' do
      it 'has all of its rides' do
        within '#all-rides' do
          expect(page).to have_content(ride1.name)
          expect(page).to have_content(ride2.name)
          expect(page).to have_content(ride3.name)
        end
      end

      it 'has all the open rides ordered by thrill rating' do
        within '#open-rides' do
          expect('Bungie Jump').to appear_before('2F2F', only_text: true)
        end
      end
    end

    describe 'adding a ride' do
      let!(:ride4) { Ride.create!(name: 'New Ride', thrill_rating: 123, open: false, amusement_park_id: park.id) }

      it 'has a form that adds a ride to its workload' do
        fill_in :ride_id, with: ride4.id
        click_button 'Add'

        expect(current_path).to eq(mechanic_path(mech1))
        expect(page).to have_content(ride4.name)
      end
    end
  end
end
