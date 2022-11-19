require 'rails_helper'

RSpec.describe "Home", type: :system do
  describe "#top" do
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
      visit root_path
    end

    describe "ファーストビュー部分のテスト" do
      context "未ログインの場合" do
        it "新規登録・ログイン・ゲストログインの3つのリンクが表示されていること" do
          expect(page).to have_link "> 新規登録してギア編成を投稿する"
          expect(page).to have_link "> ログインはこちら"
          expect(page).to have_link "> ゲストログインはこちら"
        end

        it "投稿するリンクが表示されていないこと" do
          expect(page).not_to have_link "> ギア編成を投稿する"
        end
      end

      context "ログイン済みの場合" do
        before do
          sign_in users[0]
          visit root_path
        end

        it "新規登録・ログイン・ゲストログインの3つのリンクが表示されていないこと" do
          expect(page).not_to have_link "> 新規登録してギア編成を投稿する"
          expect(page).not_to have_link "> ログインはこちら"
          expect(page).not_to have_link "> ゲストログインはこちら"
        end

        it "投稿するリンクのみ表示されていること" do
          expect(page).to have_link "> ギア編成を投稿する"
        end
      end

      it "検索フォームで投稿を検索できること" do
        within ".top-search-area" do
          fill_in "q[title_or_user_name_or_weapon_or_battle_cont]", with: posts[0].title
          click_button "検索"
        end
        expect(page).to have_content posts[0].title
      end
    end

    describe "投稿部分のテスト", js: true do
      it "初期状態では新着投稿側が表示され、人気投稿側が表示されていないこと" do
        expect(page).to have_content posts[10].title
        expect(page).not_to have_content posts[0].title
      end

      it "新着投稿から人気投稿に切り替えできること" do
        find('label[for=toggle_favorites]').click
        expect(page).not_to have_content posts[10].title
        expect(page).to have_content posts[0].title
      end

      it "人気投稿から新着投稿に戻せること" do
        find('label[for=toggle_favorites]').click
        find('label[for=toggle_posts]').click
        expect(page).to have_content posts[10].title
        expect(page).not_to have_content posts[0].title
      end

      it "新着投稿で直近の5件の投稿を表示していること" do
        posts.last(5).all? do |post|
          expect(page).to have_content post.title
        end
      end

      it "新着投稿で直近の6件目の投稿を表示していないこと" do
        expect(page).not_to have_content posts[5].title
      end

      it "人気投稿で人気順に5件の投稿を表示していること" do
        find('label[for=toggle_favorites]').click
        posts.first(5).all? do |post|
          expect(page).to have_content post.title
        end
      end

      it "人気投稿で人気順に6件目の投稿を表示していないこと" do
        find('label[for=toggle_favorites]').click
        expect(page).not_to have_content posts[5].title
      end
    end

    describe "ユーザー部分のテスト" do
      it "直近の10件のユーザーを表示していること" do
        users.last(10).all? do |user|
          expect(page).to have_content user.name
        end
      end

      it "直近の11件目のユーザーを表示していないこと" do
        expect(page).not_to have_content users[0].name
      end
    end

    describe "ギアパワー部分のテスト" do
      it "gear_powersテーブルに登録済みのギアパワーを全て表示していること" do
        gear_powers.all? do |gear_power|
          expect(page).to have_content gear_power.name
        end
      end

      it "ギアパワーのアイコン画像を表示していること" do
        gear_powers.all? do |gear_power|
          expect(page).to have_selector "img[src$='gear_power_#{gear_power.id}.png']"
        end
      end
    end
  end
end
