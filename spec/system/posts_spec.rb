require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "#new" do
    let(:user) { create(:user) }

    context "まだログインしていない場合" do
      before do
        visit new_post_path
      end

      it "新規投稿ページに遷移したらログインページへリダイレクトすること" do
        expect(current_path).to eq new_user_session_path
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "アカウント登録もしくはログインしてください。"
      end
    end

    context "すでにログインしている場合" do
      before do
        sign_in user
        visit new_post_path
      end

      describe "パンくずのテスト" do
        it "パンくずを正しく表示していること" do
          within ".breadcrumbs" do
            expect(page).to have_css "i.fa-solid"
            expect(page).to have_css "i.fa-house"
            expect(page).to have_content "Home"
            expect(page).to have_content "新規投稿"
            expect(page).to have_css "span.current"
          end
        end

        it "パンくずで正しく遷移すること" do
          within ".breadcrumbs" do
            click_link "Home"
            expect(current_path).to eq root_path
          end
        end
      end

      describe "新規投稿のテスト" do
        context "新規投稿に成功した場合" do
          before do
            fill_in "post[title]", with: "テストタイトル"
            select "スプラシューター", from: "post[weapon]"
            select "ガチヤグラ", from: "post[battle]"
            fill_in "post[comment]", with: "テストコメント"
            find("label[for=post_head_main_1]").click
            find("label[for=post_head_sub1_2]").click
            find("label[for=post_head_sub2_3]").click
            find("label[for=post_head_sub3_4]").click
            find("label[for=post_body_main_5]").click
            find("label[for=post_body_sub1_6]").click
            find("label[for=post_body_sub2_7]").click
            find("label[for=post_body_sub3_8]").click
            find("label[for=post_shoes_main_9]").click
            find("label[for=post_shoes_sub1_10]").click
            find("label[for=post_shoes_sub2_11]").click
            find("label[for=post_shoes_sub3_12]").click
            click_button "投稿する"
          end

          it "新規投稿成功後の遷移先が正しいこと" do
            expect(current_path).to eq posts_path
          end

          it "新規投稿成功後に正しいフラッシュを表示していること" do
            expect(page).to have_content "投稿が完了しました。"
          end

          it "postsテーブルに投稿が登録されていること" do
            expect(Post.all.count).to eq 1
          end
        end

        context "新規投稿に失敗した場合" do
          before do
            fill_in "post[title]", with: "テストタイトル"
            select "スプラシューター", from: "post[weapon]"
            select "ガチヤグラ", from: "post[battle]"
            fill_in "post[comment]", with: "テストコメント"
            find("label[for=post_head_main_1]").click
            click_button "投稿する"
          end

          it "新規投稿失敗後の遷移先が正しいこと" do
            expect(current_path).to eq "/posts"
          end

          it "選択されていないギアパワーがあると新規投稿できないこと" do
            expect(Post.all.count).to eq 0
          end

          it "選択されていないギアパワーがあるとバリデーションのエラーメッセージが表示されること" do
            expect(page).to have_content "入力エラーが発生しています。"
            expect(page).to have_content "アタマのサブパワー1を入力してください。"
          end

          it "新規投稿後の、入力していた情報の引継ぎが正しいこと" do
            expect(page).to have_xpath "//input[@id='post_title'][@value='テストタイトル']"
            expect(page).to have_select "post[weapon]", selected: "スプラシューター"
            expect(page).to have_select "post[battle]", selected: "ガチヤグラ"
            expect(page).to have_content "テストコメント"
            expect(page).to have_checked_field with: "1", visible: false
          end
        end
      end

      describe "ラジオボタンのテスト", js: true do
        it "選択したラジオボタン直下の「※ 選択必須です」が消えること" do
          find("label[for=post_head_main_1]").click
          find("label[for=post_head_sub1_2]").click
          within "#radio-head-main" do
            expect(page).not_to have_content "※ 選択必須です"
          end
          within "#radio-head-sub1" do
            expect(page).not_to have_content "※ 選択必須です"
          end
        end

        it "選択していないラジオボタン直下の「※ 選択必須です」が消えないこと" do
          find("label[for=post_head_main_1]").click
          within "#radio-head-sub1" do
            expect(page).to have_content "※ 選択必須です"
          end
        end
      end
    end
  end

  describe "#index" do
    let!(:post1) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:post2) { create(:post, weapon: "スプラシューター", battle: "ナワバリバトル", head_main: 1) }
    let!(:gear_power) { create(:gear_power1) }

    before do
      visit posts_path
    end

    describe "パンくずのテスト" do
      it "パンくずを正しく表示していること" do
        within ".breadcrumbs" do
          expect(page).to have_css "i.fa-solid"
          expect(page).to have_css "i.fa-house"
          expect(page).to have_content "Home"
          expect(page).to have_content "投稿"
          expect(page).to have_css "span.current"
        end
      end

      it "パンくずで正しく遷移すること" do
        within ".breadcrumbs" do
          click_link "Home"
          expect(current_path).to eq root_path
        end
      end
    end

    describe "一覧部分のテスト" do
      it "投稿の各情報を表示していること" do
        expect(page).to have_content post1.user.name
        expect(page).to have_content post1.created_at.to_s(:custom_no_year)
        expect(page).to have_content post1.title
        expect(page).to have_content post1.weapon
        expect(page).to have_content post1.battle
        expect(page).to have_content post2.user.name
        expect(page).to have_content post2.created_at.to_s(:custom_no_year)
        expect(page).to have_content post2.title
        expect(page).to have_content post2.weapon
        expect(page).to have_content post2.battle
      end

      it "ユーザーのアイコンを表示していること" do
        expect(page).to have_selector "img[src$='user_image_default_bk.png']"
      end

      it "ギアパワーの各アイコンを表示していること" do
        expect(page).to have_selector "img[src$='gear_power_#{post1.head_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.head_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.head_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.head_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.body_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.body_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.body_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.body_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.shoes_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.shoes_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.shoes_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post1.shoes_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.head_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.head_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.head_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.head_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.body_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.body_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.body_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.body_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.shoes_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.shoes_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.shoes_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post2.shoes_sub3}.png']"
      end

      it "ユーザーのアイコンをクリックするとユーザー詳細ページへ遷移すること" do
        click_link "デフォルトユーザーアイコン", match: :first
        expect(current_path).to eq user_path(post2.user)
      end

      it "ユーザーの名前をクリックするとユーザー詳細ページへ遷移すること" do
        click_link post2.user.name
        expect(current_path).to eq user_path(post2.user)
      end

      it "投稿のタイトルをクリックすると投稿詳細ページへ遷移すること" do
        click_link post2.title
        expect(current_path).to eq post_path(post2)
      end

      it "編成詳細へをクリックすると投稿詳細ページへ遷移すること" do
        click_link "> 編成詳細へ", match: :first
        expect(current_path).to eq post_path(post2)
      end

      it "ギアパワーのアイコンをクリックするとギアパワー詳細ページへ遷移すること" do
        within ".post:first-child" do
          click_link "ギアパワー", match: :first
          expect(current_path).to eq gear_power_path(post2.head_main)
        end
      end
    end
  end
end
