require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides_mechanics) }
    it { should have_many(:rides).through(:rides_mechanics)}
  end
end
