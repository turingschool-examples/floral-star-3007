require 'rails_helper'

RSpec.describe Mechanic do
  describe "relationships" do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  it 'can calculate the average years of experience for all mechanics' do
    kara = Mechanic.create!(name: 'Kara Smith', years_experience:3)
    sam = Mechanic.create!(name: 'Sam Adams', years_experience:2)

    expect(Mechanic.average_years).to eq(2.5)
  end
end
