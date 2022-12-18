require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /new" do
    before do
      get new_contact_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end
  end
end
