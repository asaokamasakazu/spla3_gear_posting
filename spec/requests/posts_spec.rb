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

  describe "GET /index" do
    let!(:post1) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:post2) { create(:post, weapon: "スプラシューター", battle: "ナワバリバトル") }

    before do
      get posts_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "投稿の各情報を取得していること" do
      expect(response.body).to include post1.user.name
      expect(response.body).to include post1.created_at.to_s(:custom_no_year)
      expect(response.body).to include post1.title
      expect(response.body).to include post1.weapon
      expect(response.body).to include post1.battle
      expect(response.body).to include post2.user.name
      expect(response.body).to include post2.created_at.to_s(:custom_no_year)
      expect(response.body).to include post2.title
      expect(response.body).to include post2.weapon
      expect(response.body).to include post2.battle
    end

    it "ユーザーのアイコン画像を取得していること" do
      expect(response.body).to include "user_image_default_bk.png"
    end

    it "ギアパワーの各アイコン画像を取得していること" do
      expect(response.body).to include "gear_power_#{post1.head_main}.png"
      expect(response.body).to include "gear_power_#{post1.head_sub1}.png"
      expect(response.body).to include "gear_power_#{post1.head_sub2}.png"
      expect(response.body).to include "gear_power_#{post1.head_sub3}.png"
      expect(response.body).to include "gear_power_#{post1.body_main}.png"
      expect(response.body).to include "gear_power_#{post1.body_sub1}.png"
      expect(response.body).to include "gear_power_#{post1.body_sub2}.png"
      expect(response.body).to include "gear_power_#{post1.body_sub3}.png"
      expect(response.body).to include "gear_power_#{post1.shoes_main}.png"
      expect(response.body).to include "gear_power_#{post1.shoes_sub1}.png"
      expect(response.body).to include "gear_power_#{post1.shoes_sub2}.png"
      expect(response.body).to include "gear_power_#{post1.shoes_sub3}.png"
      expect(response.body).to include "gear_power_#{post2.head_main}.png"
      expect(response.body).to include "gear_power_#{post2.head_sub1}.png"
      expect(response.body).to include "gear_power_#{post2.head_sub2}.png"
      expect(response.body).to include "gear_power_#{post2.head_sub3}.png"
      expect(response.body).to include "gear_power_#{post2.body_main}.png"
      expect(response.body).to include "gear_power_#{post2.body_sub1}.png"
      expect(response.body).to include "gear_power_#{post2.body_sub2}.png"
      expect(response.body).to include "gear_power_#{post2.body_sub3}.png"
      expect(response.body).to include "gear_power_#{post2.shoes_main}.png"
      expect(response.body).to include "gear_power_#{post2.shoes_sub1}.png"
      expect(response.body).to include "gear_power_#{post2.shoes_sub2}.png"
      expect(response.body).to include "gear_power_#{post2.shoes_sub3}.png"
    end
  end
end
