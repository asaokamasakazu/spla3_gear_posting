require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /list" do
    let!(:user1) { create(:user, prowess: "A+") }
    let!(:user2) { create(:user, prowess: "B-") }

    before do
      get list_users_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "ユーザーを全件取得していること" do
      expect(response.body).to include user1.name
      expect(response.body).to include user2.name
    end

    it "ユーザーの各情報を取得していること" do
      expect(response.body).to include user1.rank.to_s
      expect(response.body).to include user1.prowess
      # posts作成後に投稿数と被お気に入り数の有無を追加する
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_ye.png"
    end
  end

  describe "GET /show" do
    let(:user) { create(:user, prowess: "A+") }

    before do
      sign_in user
      get user_path(user)
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "プロフィール編集ボタンを取得していること" do
      expect(response.body).to include "プロフィールを編集"
    end

    it "ユーザーの各情報を取得していること" do
      expect(response.body).to include user.name
      expect(response.body).to include user.rank.to_s
      expect(response.body).to include user.prowess
      expect(response.body).to include user.profile
      # posts作成後に投稿数と被お気に入り数の有無を追加する
    end

    it "これまでの投稿を取得していること" do
      # posts作成後に記述する
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_ye.png"
    end
  end

  describe "GET /account" do
    let!(:user) { create(:user, prowess: "A+") }

    before do
      sign_in user
      get account_users_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "ユーザーの各情報を取得していること" do
      expect(response.body).to include user.name
      expect(response.body).to include user.rank.to_s
      expect(response.body).to include user.prowess
      expect(response.body).to include user.profile
      expect(response.body).to include user.email
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_bk.png"
    end
  end

  describe "GET /edit" do
    let!(:user) { create(:user, prowess: "A+") }

    before do
      sign_in user
      get edit_user_registration_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "ユーザーの各情報を取得していること" do
      expect(response.body).to include user.name
      expect(response.body).to include user.rank.to_s
      expect(response.body).to include user.prowess
      expect(response.body).to include user.profile
      expect(response.body).to include user.email
    end
  end

  describe "GET /sign_up" do
    it "正常なレスポンスを返すこと" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign_in" do
    it "正常なレスポンスを返すこと" do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end
end
