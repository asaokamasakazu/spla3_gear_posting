require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /top" do
    let!(:posts) { create_list(:post, 11, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:users) { create_list(:user, 11) }
    # post[0]〜post[4]のお気に入り数を2にする
    let!(:favorites) do
      2.times.collect do |i1|
        5.times.collect do |i2|
          create(:favorite, user: users[i1], post: posts[i2])
        end
      end
    end
    # post[5]のお気に入り数を1にする
    let!(:favorite) { create(:favorite, user: users[0], post: posts[5]) }
    let!(:gear_powers) { create_list(:gear_power1, 10) }

    before do
      get root_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    describe "投稿部分のテスト" do
      it "直近の5件の投稿を取得していること" do
        posts.last(5).all? do |post|
          expect(response.body).to include post.title
        end
      end

      it "人気順に5件の投稿を取得していること" do
        posts.first(5).all? do |post|
          expect(response.body).to include post.title
        end
      end

      it "直近6件目の投稿と人気順6件目の投稿を取得していないこと" do
        expect(response.body).not_to include posts[5].title
      end
    end

    describe "ユーザー部分のテスト" do
      it "直近の10件のユーザーを取得していること" do
        users.last(10).all? do |user|
          expect(response.body).to include user.name
        end
      end

      it "直近の11件目のユーザーを取得していないこと" do
        expect(response.body).not_to include users[0].name
      end
    end

    describe "ギアパワー部分のテスト" do
      it "gear_powersテーブルに登録済みのギアパワーを全て取得していること" do
        gear_powers.all? do |gear_power|
          expect(response.body).to include gear_power.name
        end
      end
    end
  end
end
