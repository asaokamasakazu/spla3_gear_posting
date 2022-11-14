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

    it "総投稿数を取得していること" do
      expect(response.body).to include "総投稿数：2件"
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

  describe "GET /show" do
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:gear_powers) { create_list(:gear_power1, 27) }
    let!(:head_main) { GearPower.find(post.head_main) }
    let!(:head_sub1) { GearPower.find(post.head_sub1) }
    let!(:head_sub2) { GearPower.find(post.head_sub2) }
    let!(:head_sub3) { GearPower.find(post.head_sub3) }
    let!(:body_main) { GearPower.find(post.body_main) }
    let!(:body_sub1) { GearPower.find(post.body_sub1) }
    let!(:body_sub2) { GearPower.find(post.body_sub2) }
    let!(:body_sub3) { GearPower.find(post.body_sub3) }
    let!(:shoes_main) { GearPower.find(post.shoes_main) }
    let!(:shoes_sub1) { GearPower.find(post.shoes_sub1) }
    let!(:shoes_sub2) { GearPower.find(post.shoes_sub2) }
    let!(:shoes_sub3) { GearPower.find(post.shoes_sub3) }

    before do
      get post_path(post)
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "投稿タイトルを取得していること" do
      expect(response.body).to include post.title
    end

    it "編集するボタンと削除するボタンを取得していること" do
      sign_in post.user
      get post_path(post)
      expect(response.body).to include "編集する"
      expect(response.body).to include "削除する"
    end

    it "投稿者を取得していること" do
      expect(response.body).to include post.user.name
      expect(response.body).to include "user_image_default_bk.png"
    end

    it "投稿日時を取得していること" do
      expect(response.body).to include post.created_at.to_s(:custom_with_year)
    end

    it "更新日時を取得していること" do
      expect(response.body).to include post.updated_at.to_s(:custom_with_year)
    end

    it "おすすめブキを取得していること" do
      expect(response.body).to include post.weapon
    end

    it "おすすめバトルを取得していること" do
      expect(response.body).to include post.battle
      expect(response.body).to include "3.png"
    end

    it "ギアパワーを取得していること" do
      expect(response.body).to include head_main.name
      expect(response.body).to include head_sub1.name
      expect(response.body).to include head_sub2.name
      expect(response.body).to include head_sub3.name
      expect(response.body).to include body_main.name
      expect(response.body).to include body_sub1.name
      expect(response.body).to include body_sub2.name
      expect(response.body).to include body_sub3.name
      expect(response.body).to include shoes_main.name
      expect(response.body).to include shoes_sub1.name
      expect(response.body).to include shoes_sub2.name
      expect(response.body).to include shoes_sub3.name
      expect(response.body).to include "gear_power_#{post.head_main}.png"
      expect(response.body).to include "gear_power_#{post.head_sub1}.png"
      expect(response.body).to include "gear_power_#{post.head_sub2}.png"
      expect(response.body).to include "gear_power_#{post.head_sub3}.png"
      expect(response.body).to include "gear_power_#{post.body_main}.png"
      expect(response.body).to include "gear_power_#{post.body_sub1}.png"
      expect(response.body).to include "gear_power_#{post.body_sub2}.png"
      expect(response.body).to include "gear_power_#{post.body_sub3}.png"
      expect(response.body).to include "gear_power_#{post.shoes_main}.png"
      expect(response.body).to include "gear_power_#{post.shoes_sub1}.png"
      expect(response.body).to include "gear_power_#{post.shoes_sub2}.png"
      expect(response.body).to include "gear_power_#{post.shoes_sub3}.png"
    end

    it "コメントを取得していること" do
      expect(response.body).to include post.comment
    end
  end

  describe "GET /edit" do
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }

    before do
      sign_in post.user
      get edit_post_path(post)
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "投稿の各情報を取得していること" do
      expect(response.body).to include post.title
      expect(response.body).to include post.weapon
      expect(response.body).to include post.battle
      expect(response.body).to include post.comment
    end
  end
end
