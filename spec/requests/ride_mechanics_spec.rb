require 'rails_helper'

RSpec.describe "RideMechanics", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/ride_mechanics/create"
      expect(response).to have_http_status(:success)
    end
  end

end
