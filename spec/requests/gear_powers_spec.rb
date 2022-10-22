require 'rails_helper'

RSpec.describe "GearPowers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/gear_powers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/gear_powers/show"
      expect(response).to have_http_status(:success)
    end
  end

end
