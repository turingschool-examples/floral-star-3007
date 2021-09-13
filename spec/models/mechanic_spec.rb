require 'rails_helper'

describe Mechanic do
  describe 'relationship' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end
end