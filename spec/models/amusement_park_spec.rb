require 'rails_helper'
# rspec spec/models/amusement_park_spec.rb
RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end
end
