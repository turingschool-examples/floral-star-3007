require 'rails_helper'

RSpec.describe Mechanic do
  describe 'validations' do
    it {should validate_precense_of :name}
    it {should validate_precense_of :years_experience}
  end

  describe 'relationships' do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:rides).through(:mechanic_rides)}
  end
end
