require 'rails_helper'

RSpec.describe 'mechanic show' do
  describe 'show page' do
    let!(:mech1) { Mechanic.create!(name: 'Steve', years_of_experience: 10) }
    let!(:park)  { AmusementPark.create(name: 'Six Flags', price_of_admission: 20) }
    let!(:ride1) { mech1.rides.create!(name: '2F2F', thrill_rating: 5, open: true, amusement_park_id: park.id) }
    let!(:ride2) { mech1.rides.create!(name: 'Splash Town', thrill_rating: 2, open: false, amusement_park_id: park.id) }
    let!(:ride3) { mech1.rides.create!(name: 'Bungie Jump', thrill_rating: 10, open: true, amusement_park_id: park.id) }

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
  end
end
