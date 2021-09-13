require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics), through: :ride_mechanics }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thrill_rating) }
    it { should allow_value(true).for (:open) }
    it { should allow_value(false).for (:open) }
  end

  describe 'methods' do
    it 'orders rides by decending thrill rating' do
      @land_of_oz = AmusementPark.create!(name: 'Land of Oz', price_of_admission: 26)
      ride1 = Ride.create!(amusement_park_id: @land_of_oz.id, name: 'Blizzard', thrill_rating: 15, open: true)
      ride2 = Ride.create!(amusement_park_id: @land_of_oz.id, name: 'Bone Chiller', thrill_rating: 20, open: true)
      ride3 = Ride.create!(amusement_park_id: @land_of_oz.id, name: 'Tingler', thrill_rating: 10, open: false)

      Ride.all.should eq([ride2, ride1, ride3])
    end
  end
end
