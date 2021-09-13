require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    before :each do
      @mech_1 = Mechanic.create!(name: "Bob", years_experience: 7)
      @mech_2 = Mechanic.create!(name: "Jenny", years_experience: 12)
      @mech_3 = Mechanic.create!(name: "Pat", years_experience: 4)
    end

    describe '#av_experience' do
      it "caluclates the average experience of all mechanics" do
        expect(Mechanic.av_experience.round(2)).to eq(7.67)
      end
    end
  end
end
