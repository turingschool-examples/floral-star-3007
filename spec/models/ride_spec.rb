require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:rides_mechanics) }
    it { should have_many(:mechanics).through(:rides_mechanics)}
  end
end
