require 'rails_helper'

describe Mechanic do
  describe 'relationship' do
    it {should have_many :rides}
  end
end