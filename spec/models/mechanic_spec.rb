require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  it { should have_many(:rides).through(:mechanic_rides) }

  describe 'methods' do
    let!(:mech1) { Mechanic.create!(name: 'Steve', years_of_experience: 10) }
    let!(:mech2) { Mechanic.create!(name: 'Jen', years_of_experience: 8) }

    describe 'class methods' do
      it 'has the average years of experience' do
        expect(Mechanic.average_experience).to eq(9)
      end
    end

    describe 'instance methods' do
      let!(:park)  { AmusementPark.create(name: 'Six Flags', price_of_admission: 20) }
      let(:ride1) { mech1.rides.create!(name: '2F2F', thrill_rating: 5, open: true, amusement_park_id: park.id) }
      let(:ride2) { mech1.rides.create!(name: 'Splash Town', thrill_rating: 2, open: false, amusement_park_id: park.id) }
      let(:ride3) { mech1.rides.create!(name: 'Bungie Jump', thrill_rating: 10, open: true, amusement_park_id: park.id) }

      it 'has the open rides ordered by thrill rating desc' do
        expect(mech1.open_rides).to eq([ride3, ride1])
      end
    end
  end
end
