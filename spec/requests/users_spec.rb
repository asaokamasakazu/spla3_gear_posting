require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /list" do
    let(:user1) { create(:user, prowess: "A+") }
    let(:user2) { create(:user, prowess: "B-") }
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user1) }
    let!(:favorite) { create(:favorite, user: user2, post: post) }

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
      expect(response.body).to include "投稿数 1"
      expect(response.body).to include "被お気に入り数 1"
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_ye.png"
    end
  end

  describe "GET /search" do
    let(:user1) { create(:user, prowess: "A+") }
    let(:user2) { create(:user, prowess: "B-") }
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user1) }
    let!(:favorite) { create(:favorite, user: user2, post: post) }

    before do
      get search_users_path
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
      expect(response.body).to include "投稿数 1"
      expect(response.body).to include "被お気に入り数 1"
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_ye.png"
    end
  end

  describe "GET /show" do
    let(:user) { create(:user, prowess: "A+") }
    let(:post1) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user) }
    let!(:post2) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user) }
    let(:post3) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:favorite1) { create(:favorite, user: post3.user, post: post1) }
    let!(:favorite2) { create(:favorite, user: user, post: post3) }

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
    end

    it "自身の投稿を取得していること" do
      expect(response.body).to include post1.title
      expect(response.body).to include post2.title
    end

    it "自身がお気に入りした投稿を取得していること" do
      expect(response.body).to include post3.title
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_ye.png"
    end
  end

  describe "GET /account" do
    let(:user) { create(:user, prowess: "A+") }

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
    let(:user) { create(:user, prowess: "A+") }

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
