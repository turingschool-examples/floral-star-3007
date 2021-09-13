require 'rails_helper'

RSpec.describe Mechanic do
    before :each do
        mech_1 = Mechanic.create!({name: "Dog", years_experience: 4})  
        mech_2 = Mechanic.create!({name: "Bird", years_experience: 6})
        mech_3 = Mechanic.create!({name: "Squirel", years_experience: 20})      
    end

    describe 'Relationships' do
        it { should have_many(:mechanic_rides)}
        it { should have_many(:rides).through(:mechanic_rides)}
    end

    describe 'Instance Methods' do

    end

    describe 'Class Methods' do
        it 'should take the average of all years experience' do
            expect(Mechanic.avg_years_experience).to eq(10)
        end
    end
end