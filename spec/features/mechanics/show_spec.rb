require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @park = AmusementPark.create!(name: 'Funtown', price_of_admission: 50)
    @ride1 = @park.rides.create!(name: 'Coaster', thrill_rating: 10, open: true)
    @ride2 = @park.rides.create!(name: 'Coaster', thrill_rating: 20, open: true)
    @ride3 = @park.rides.create!(name: 'Coaster', thrill_rating: 30, open: true)
    @ride4 = @park.rides.create!(name: 'Coaster', thrill_rating: 40, open: true)

  end
end
