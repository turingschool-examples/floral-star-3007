require 'rails_helper'

RSpec.describe 'mechanics index' do
  describe 'info about mechanics' do
    let!(:mech1) { Mechanic.create!(name: 'Steve', years_of_experience: 10) }
    let!(:mech2) { Mechanic.create!(name: 'Jen', years_of_experience: 8) }
    # let(:ride1) { mech1.rides.create!(name: '2F2F', thrill_rating: 5, open: true, amusement_park_id: park.id) }
    # let(:ride2) { mech1.rides.create!(name: 'Splash Town', thrill_rating: 2, open: false, amusement_park_id: park.id) }
    # let(:ride3) { mech2.rides.create!(name: 'Doom Dropper', thrill_rating: 12, open: true, amusement_park_id: park.id) }
    # let(:ride4) { mech2.rides.create!(name: 'Turn Table', thrill_rating: 7, open: false, amusement_park_id: park.id) }

    before :each do
      visit mechanics_path
    end

    it 'has a header saying all mechanics' do
      expect(page).to have_content("All Mechanics")
    end

    it 'has mechanic names and years of experience' do

      expect(page).to have_content(mech1.name)
      expect(page).to have_content(mech1.years_of_experience)
      expect(page).to have_content(mech2.name)
      expect(page).to have_content(mech2.years_of_experience)
    end
  end
end
