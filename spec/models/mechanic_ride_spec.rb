require 'rails_helper'
# rspec spec/models/mechanic_ride_spec.rb
RSpec.describe MechanicRide, type: :model do
  describe 'relationships' do
    it { should belong_to(:mechanic) }
    it { should belong_to(:ride) }
  end
end
