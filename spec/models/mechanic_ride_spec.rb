require 'rails_helper'

RSpec.describe MechanicRide do
  it {should belong_to :ride}
  it {should beloong_to :mechanic}
end
