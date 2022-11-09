require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /new" do
    let(:user) { create(:user) }

    it "正常なレスポンスを返すこと" do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end
end
