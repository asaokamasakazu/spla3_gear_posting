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

          it "新規投稿失敗後の、入力していた情報の引継ぎが正しいこと" do
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
    let(:user1) { create(:user, name: "ユーザー1", prowess: "A+") }
    let(:user2) { create(:user, name: "ユーザー2", prowess: "B-") }
    let(:post1) { create(:post, title: "タイトル1", weapon: "わかばシューター", battle: "ガチヤグラ", user: user1) }
    let!(:post2) { create(:post, title: "タイトル2", weapon: "スプラシューター", battle: "ガチホコ", user: user2) }
    let!(:post3) { create(:post, weapon: "わかばシューター", battle: "ガチホコ", user: user2) }
    let!(:gear_powers) { create_list(:gear_power1, 27) }
    let!(:favorite) { create(:favorite, user: user1, post: post1) }

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
      it "総投稿数を表示していること" do
        expect(page).to have_content "総投稿数：3件"
      end

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
        expect(current_path).to eq user_path(post1.user)
      end

      it "ユーザーの名前をクリックするとユーザー詳細ページへ遷移すること" do
        click_link post1.user.name
        expect(current_path).to eq user_path(post1.user)
      end

      it "投稿のタイトルをクリックすると投稿詳細ページへ遷移すること" do
        click_link post2.title
        expect(current_path).to eq post_path(post2)
      end

      it "編成詳細へをクリックすると投稿詳細ページへ遷移すること" do
        click_link "> 編成詳細へ", match: :first
        expect(current_path).to eq post_path(post1)
      end

      it "ギアパワーのアイコンをクリックするとギアパワー詳細ページへ遷移すること" do
        within ".post:first-child" do
          click_link "ギアパワー", match: :first
          expect(current_path).to eq gear_power_path(post1.head_main)
        end
      end
    end

    describe "お気に入り機能のテスト" do
      context "未ログインの場合" do
        it "お気に入りボタンを押すとログイン画面にリダイレクトすること" do
          click_link "1件"
          expect(current_path).to eq new_user_session_path
        end

        it "リダイレクト後に正しいフラッシュを表示していること" do
          click_link "1件"
          expect(page).to have_content "アカウント登録もしくはログインしてください。"
        end
      end

      context "ログイン済みの場合" do
        before do
          sign_in user1
          visit posts_path
        end

        it "お気に入りボタンを正しく表示していること" do
          within ".main-container" do
            expect(page.all(".fas").count).to eq 1
            expect(page.all(".far").count).to eq 2
          end
        end

        context "お気に入りしていないボタンの場合", js: true do
          it "ボタンを押すとお気に入りできること" do
            click_link "0件", match: :first
            visit current_path
            expect(Favorite.all.count).to eq 2
          end

          it "ボタンを押すとお気に入り済みマークに切り替わること" do
            click_link "0件", match: :first
            visit current_path
            expect(page.all(".fas").count).to eq 2
            expect(page.all(".far").count).to eq 1
          end

          it "ボタンを押すと表示されるカウントが1増えること" do
            click_link "0件", match: :first
            visit current_path
            expect(page).to have_content("1件", count: 2)
            expect(page).to have_content("0件", count: 1)
          end
        end

        context "お気に入りしているボタンの場合", js: true do
          it "ボタンを押すとお気に入り解除できること" do
            click_link "1件"
            visit current_path
            expect(Favorite.all.count).to eq 0
          end

          it "ボタンを押すと未お気に入りマークに切り替わること" do
            click_link "1件"
            visit current_path
            expect(page.all(".fas").count).to eq 0
            expect(page.all(".far").count).to eq 3
          end

          it "ボタンを押すと表示されるカウントが1減ること" do
            click_link "1件"
            visit current_path
            expect(page).to have_content("1件", count: 0)
            expect(page).to have_content("0件", count: 3)
          end
        end
      end
    end

    describe "検索機能のテスト" do
      it "検索後の遷移先が正しいこと" do
        within ".main-container" do
          click_button "検索"
        end
        expect(current_path).to eq search_posts_path
      end

      it "キーワード検索でユーザー名ベースで投稿を絞り込めること" do
        within ".main-container" do
          fill_in "q[title_or_user_name_or_weapon_or_battle_cont]", with: "ユーザー1"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).not_to have_content user2.name
      end

      it "キーワード検索で投稿タイトルベースで投稿を絞り込めること" do
        within ".main-container" do
          fill_in "q[title_or_user_name_or_weapon_or_battle_cont]", with: "タイトル1"
          click_button "検索"
        end
        expect(page).to have_content post1.title
        expect(page).not_to have_content post2.title
      end

      it "ウデマエ検索で投稿を絞り込めること" do
        within ".main-container" do
          uncheck "B"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).not_to have_content user2.name
      end

      it "ブキ検索で投稿を絞り込めること" do
        select "スプラシューター", from: "q[weapon_eq]"
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content post2.title
        expect(page).not_to have_content post1.title
        expect(page).not_to have_content post3.title
      end

      it "バトル検索で投稿を絞り込めること" do
        select "ガチヤグラ", from: "q[battle_eq]"
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content post1.title
        expect(page).not_to have_content post2.title
        expect(page).not_to have_content post3.title
      end

      it "2つ以上の検索を併用してユーザーを絞り込めること" do
        select "わかばシューター", from: "q[weapon_eq]"
        within ".main-container" do
          uncheck "A"
          click_button "検索"
        end
        expect(page).to have_content post3.title
        expect(page).not_to have_content post1.title
        expect(page).not_to have_content post2.title
      end

      it "デフォルトの状態で検索すると投稿が全件表示されること" do
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content post1.title
        expect(page).to have_content post2.title
        expect(page).to have_content post3.title
      end

      it "該当するユーザーがいなかった場合に、メッセージが表示されること" do
        within ".main-container" do
          uncheck "S"
          uncheck "A"
          uncheck "B"
          uncheck "C"
          uncheck "未設定"
          click_button "検索"
        end
        expect(page).to have_content "条件に一致する検索はありません。"
      end
    end
  end

  describe "#search" do
    let(:user1) { create(:user, name: "ユーザー1", prowess: "A+") }
    let(:user2) { create(:user, name: "ユーザー2", prowess: "B-") }
    let!(:post1) { create(:post, title: "タイトル1", weapon: "わかばシューター", battle: "ガチヤグラ", user: user1) }
    let!(:post2) { create(:post, title: "タイトル2", weapon: "スプラシューター", battle: "ガチホコ", user: user2) }
    let!(:post3) { create(:post, weapon: "わかばシューター", battle: "ガチホコ", user: user2) }
    let!(:gear_powers) { create_list(:gear_power1, 27) }

    before do
      visit search_posts_path
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

    describe "検索機能のテスト" do
      it "ダイレクトで訪れた場合は全投稿を表示していること" do
        expect(page).to have_content post1.title
        expect(page).to have_content post2.title
        expect(page).to have_content post3.title
      end

      it "デフォルトの状態で検索すると投稿が表示されないこと" do
        within ".main-container" do
          click_button "検索"
        end
        expect(page).not_to have_content post1.title
        expect(page).not_to have_content post2.title
        expect(page).not_to have_content post3.title
      end

      it "検索後の遷移先が正しいこと" do
        within ".main-container" do
          click_button "検索"
        end
        expect(current_path).to eq search_posts_path
      end

      it "キーワード検索でユーザー名ベースで投稿を絞り込めること" do
        within ".main-container" do
          fill_in "q[title_or_user_name_or_weapon_or_battle_cont]", with: "ユーザー1"
          check "S"
          check "A"
          check "B"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).not_to have_content user2.name
      end

      it "キーワード検索で投稿タイトルベースで投稿を絞り込めること" do
        within ".main-container" do
          fill_in "q[title_or_user_name_or_weapon_or_battle_cont]", with: "タイトル1"
          check "S"
          check "A"
          check "B"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content post1.title
        expect(page).not_to have_content post2.title
      end

      it "ウデマエ検索で投稿を絞り込めること" do
        within ".main-container" do
          check "S"
          check "A"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).not_to have_content user2.name
      end

      it "ブキ検索で投稿を絞り込めること" do
        select "スプラシューター", from: "q[weapon_eq]"
        within ".main-container" do
          check "S"
          check "A"
          check "B"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content post2.title
        expect(page).not_to have_content post1.title
        expect(page).not_to have_content post3.title
      end

      it "バトル検索で投稿を絞り込めること" do
        select "ガチヤグラ", from: "q[battle_eq]"
        within ".main-container" do
          check "S"
          check "A"
          check "B"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content post1.title
        expect(page).not_to have_content post2.title
        expect(page).not_to have_content post3.title
      end

      it "2つ以上の検索を併用してユーザーを絞り込めること" do
        within ".main-container" do
          check "S"
          check "B"
          check "C"
          check "未設定"
          select "わかばシューター", from: "q[weapon_eq]"
          click_button "検索"
        end
        expect(page).to have_content post3.title
        expect(page).not_to have_content post1.title
        expect(page).not_to have_content post2.title
      end

      it "該当するユーザーがいなかった場合に、メッセージが表示されること" do
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content "条件に一致する検索はありません。"
      end
    end
  end

  describe "#show" do
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let(:updated_post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", updated_at: "1/1") }
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
    let!(:favorite) { create(:favorite, user: post.user, post: post) }

    before do
      visit post_path(post)
    end

    describe "パンくずのテスト" do
      it "パンくずを正しく表示していること" do
        within ".breadcrumbs" do
          expect(page).to have_css "i.fa-solid"
          expect(page).to have_css "i.fa-house"
          expect(page).to have_content "Home"
          expect(page).to have_content "投稿"
          expect(page).to have_content post.title
          expect(page).to have_css "span.current"
        end
      end

      it "パンくずのHomeをクリックするとトップページへ遷移すること" do
        within ".breadcrumbs" do
          click_link "Home"
          expect(current_path).to eq root_path
        end
      end

      it "パンくずの投稿をクリックすると投稿一覧へ遷移すること" do
        within ".breadcrumbs" do
          click_link "投稿"
          expect(current_path).to eq posts_path
        end
      end
    end

    describe "投稿内容のテスト" do
      it "投稿タイトルを表示していること" do
        expect(page).to have_selector "h2", text: post.title
      end

      it "投稿者を表示していること" do
        expect(page).to have_content post.user.name
        expect(page).to have_selector "img[src$='user_image_default_bk.png']"
      end

      it "投稿者の遷移先が正しいこと" do
        click_link post.user.name, match: :first
        expect(current_path).to eq user_path(post.user)
      end

      it "投稿日時を表示していること" do
        expect(page).to have_content post.created_at.to_s(:custom_with_year)
      end

      context "投稿を更新していない場合" do
        it "更新日時を表示していないこと" do
          expect(page).not_to have_content "に更新"
        end
      end

      context "投稿を更新している場合" do
        it "更新日時を表示していること" do
          visit post_path(updated_post)
          expect(page).to have_content "に更新"
        end
      end

      it "おすすめブキを表示していること" do
        expect(page).to have_content post.weapon
      end

      it "おすすめバトルを表示していること" do
        expect(page).to have_content post.battle
        expect(page).to have_selector "img[src$='3.png']"
      end

      it "ギアパワーを表示していること" do
        expect(page).to have_content head_main.name
        expect(page).to have_content head_sub1.name
        expect(page).to have_content head_sub2.name
        expect(page).to have_content head_sub3.name
        expect(page).to have_content body_main.name
        expect(page).to have_content body_sub1.name
        expect(page).to have_content body_sub2.name
        expect(page).to have_content body_sub3.name
        expect(page).to have_content shoes_main.name
        expect(page).to have_content shoes_sub1.name
        expect(page).to have_content shoes_sub2.name
        expect(page).to have_content shoes_sub3.name
        expect(page).to have_selector "img[src$='gear_power_#{post.head_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.head_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.head_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.head_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.body_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.body_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.body_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.body_sub3}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.shoes_main}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.shoes_sub1}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.shoes_sub2}.png']"
        expect(page).to have_selector "img[src$='gear_power_#{post.shoes_sub3}.png']"
      end

      it "ギアパワーの遷移先が正しいこと" do
        click_link head_main.name, match: :first
        expect(current_path).to eq gear_power_path(head_main)
      end

      it "コメントを表示していること" do
        expect(page).to have_content post.comment
      end
    end

    describe "編集ボタンと削除ボタンのテスト" do
      context "ログインしていない場合" do
        it "編集と削除ボタンを表示していないこと" do
          expect(page).not_to have_content "編集する"
          expect(page).not_to have_content "削除する"
        end
      end

      context "ログイン済みの場合" do
        before do
          sign_in post.user
        end

        it "自身の投稿ではないなら編集と削除ボタンを表示していないこと" do
          visit post_path(updated_post)
          expect(page).not_to have_content "編集する"
          expect(page).not_to have_content "削除する"
        end

        it "自身の投稿なら編集ボタンと削除ボタンを表示していること" do
          visit post_path(post)
          expect(page).to have_content "編集する"
          expect(page).to have_content "削除する"
        end

        it "編集ボタンの遷移先が正しいこと" do
          visit post_path(post)
          click_link "編集する"
          expect(current_path).to eq edit_post_path(post)
        end

        it "削除ボタンの遷移先が正しいこと" do
          visit post_path(post)
          click_link "削除する"
          expect(current_path).to eq posts_path
        end

        it "削除ボタン後のフラッシュが正しいこと" do
          visit post_path(post)
          click_link "削除する"
          expect(page).to have_content "投稿を削除しました。"
        end

        it "削除ボタンで投稿を削除できること" do
          visit post_path(post)
          click_link "削除する"
          expect(Post.all.count).to eq 0
        end
      end
    end

    describe "お気に入り機能のテスト" do
      context "未ログインの場合" do
        it "お気に入りボタンを押すとログイン画面にリダイレクトすること" do
          click_link "1件", match: :first
          expect(current_path).to eq new_user_session_path
        end

        it "リダイレクト後に正しいフラッシュを表示していること" do
          click_link "1件", match: :first
          expect(page).to have_content "アカウント登録もしくはログインしてください。"
        end
      end

      context "ログイン済みの場合", js: true do
        before do
          sign_in updated_post.user
          visit post_path(post)
        end

        it "お気に入りボタンを2箇所表示していること" do
          within ".title-container" do
            expect(page.all(".far").count).to eq 1
          end
          within ".main-container" do
            expect(page.all(".far").count).to eq 1
          end
        end

        it "ボタンを押すとお気に入りできること" do
          click_link "1件", match: :first
          visit current_path
          expect(Favorite.all.count).to eq 2
        end

        it "ボタンを2度押すとお気に入り解除できること" do
          click_link "1件", match: :first
          click_link "2件", match: :first
          visit current_path
          expect(Favorite.all.count).to eq 1
        end

        it "ボタンを押すとお気に入り済みマークに切り替わること" do
          click_link "1件", match: :first
          visit current_path
          expect(page.all(".fas").count).to eq 2
        end

        it "ボタンを2度押すと未お気に入りマークに切り替わること" do
          click_link "1件", match: :first
          click_link "2件", match: :first
          visit current_path
          expect(page.all(".far").count).to eq 2
        end

        it "ボタンを押すと表示されるカウントが1増えること" do
          click_link "1件", match: :first
          visit current_path
          expect(page).to have_content "2件"
        end

        it "ボタンを2度押すと表示されるカウントが1減ること" do
          click_link "1件", match: :first
          click_link "2件", match: :first
          visit current_path
          expect(page).to have_content "1件"
        end

        it "ボタンを押すとお気に入りしたユーザーに加わること" do
          click_link "1件", match: :first
          visit current_path
          within ".post-show-favorited-container" do
            expect(page).to have_content updated_post.user.name
          end
        end

        it "ボタンを2度押すとお気に入りしたユーザーから消えること" do
          click_link "1件", match: :first
          click_link "2件", match: :first
          visit current_path
          within ".post-show-favorited-container" do
            expect(page).not_to have_content updated_post.user.name
          end
        end
      end
    end
  end

  describe "#edit" do
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:gear_powers) { create_list(:gear_power1, 27) }
    let(:guest_user) { create(:user, email: "guest@example.com") }

    context "まだログインしていない場合" do
      before do
        visit edit_post_path(post)
      end

      it "投稿編集ページに遷移したらログインページへリダイレクトすること" do
        expect(current_path).to eq new_user_session_path
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "アカウント登録もしくはログインしてください。"
      end
    end

    context "非投稿者としてログインしている場合" do
      before do
        sign_in guest_user
        visit edit_post_path(post)
      end

      it "投稿編集ページに遷移したら、編集権限がないため投稿一覧ページにリダイレクトすること" do
        expect(current_path).to eq posts_path
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "権限がありません。編集を行うには、投稿者としてログインする必要があります。"
      end
    end

    context "投稿者としてログインしている場合" do
      before do
        sign_in post.user
        visit edit_post_path(post)
      end

      describe "パンくずのテスト" do
        it "パンくずを正しく表示していること" do
          within ".breadcrumbs" do
            expect(page).to have_css "i.fa-solid"
            expect(page).to have_css "i.fa-house"
            expect(page).to have_content "Home"
            expect(page).to have_content "投稿"
            expect(page).to have_content post.title
            expect(page).to have_content "投稿編集"
            expect(page).to have_css "span.current"
          end
        end

        it "パンくずのHomeをクリックするとトップページへ遷移すること" do
          within ".breadcrumbs" do
            click_link "Home"
            expect(current_path).to eq root_path
          end
        end

        it "パンくずの投稿をクリックすると投稿一覧へ遷移すること" do
          within ".breadcrumbs" do
            click_link "投稿"
            expect(current_path).to eq posts_path
          end
        end

        it "パンくずの投稿タイトルをクリックすると投稿詳細へ遷移すること" do
          within ".breadcrumbs" do
            click_link post.title
            expect(current_path).to eq post_path(post)
          end
        end
      end

      describe "投稿情報部分のテスト" do
        context "更新に成功する場合" do
          it "更新後に投稿詳細ページへリダイレクトすること" do
            click_button "更新する"
            expect(current_path).to eq post_path(post)
          end

          it "リダイレクト後に正しいフラッシュを表示していること" do
            click_button "更新する"
            expect(page).to have_content "投稿を編集しました。"
          end

          it "登録済みの情報がフォームに表示されていること" do
            within ".main-container" do
              expect(page).to have_xpath "//input[@id='post_title'][@value='#{post.title}']"
              expect(page).to have_select "post[weapon]", selected: "わかばシューター"
              expect(page).to have_select "post[battle]", selected: "ガチヤグラ"
              expect(page).to have_content post.comment
              expect(page).to have_checked_field with: "#{post.head_main}", visible: false
              expect(page).to have_checked_field with: "#{post.head_sub1}", visible: false
              expect(page).to have_checked_field with: "#{post.head_sub2}", visible: false
              expect(page).to have_checked_field with: "#{post.head_sub3}", visible: false
              expect(page).to have_checked_field with: "#{post.body_main}", visible: false
              expect(page).to have_checked_field with: "#{post.body_sub1}", visible: false
              expect(page).to have_checked_field with: "#{post.body_sub2}", visible: false
              expect(page).to have_checked_field with: "#{post.body_sub3}", visible: false
              expect(page).to have_checked_field with: "#{post.shoes_main}", visible: false
              expect(page).to have_checked_field with: "#{post.shoes_sub1}", visible: false
              expect(page).to have_checked_field with: "#{post.shoes_sub2}", visible: false
              expect(page).to have_checked_field with: "#{post.shoes_sub3}", visible: false
            end
          end

          it "タイトルの変更ができること" do
            fill_in "post[title]", with: "edited_title"
            click_button "更新する"
            expect(Post.find(post.id).title).to eq "edited_title"
          end

          it "おすすめブキの変更ができること" do
            select "スプラシューター", from: "post[weapon]"
            click_button "更新する"
            expect(Post.find(post.id).weapon).to eq "スプラシューター"
          end

          it "おすすめバトルの変更ができること" do
            select "ガチアサリ", from: "post[battle]"
            click_button "更新する"
            expect(Post.find(post.id).battle).to eq "ガチアサリ"
          end

          it "コメントの変更ができること" do
            fill_in "post[comment]", with: "edited_comment"
            click_button "更新する"
            expect(Post.find(post.id).comment).to eq "edited_comment"
          end

          it "ギアパワーの変更ができること" do
            find("label[for=post_head_main_1]").click
            find("label[for=post_head_sub1_1]").click
            find("label[for=post_head_sub2_1]").click
            find("label[for=post_head_sub3_1]").click
            click_button "更新する"
            expect(Post.find(post.id).head_main).to eq 1
            expect(Post.find(post.id).head_sub1).to eq 1
            expect(Post.find(post.id).head_sub2).to eq 1
            expect(Post.find(post.id).head_sub3).to eq 1
          end
        end

        context "更新に失敗する場合" do
          before do
            fill_in "post[title]", with: ""
            click_button "更新する"
          end

          it "更新失敗後の遷移先が正しいこと" do
            expect(current_path).to eq post_path(post)
          end

          it "更新失敗後に正しいフラッシュを表示していること" do
            expect(page).to have_content "投稿の編集に失敗しました。"
          end

          it "更新失敗後の、入力していた情報の引継ぎが正しいこと" do
            expect(page).to have_xpath "//input[@id='post_title'][@value='']"
          end
        end
      end

      describe "投稿削除のテスト" do
        before do
          click_link "投稿の削除"
        end

        it "削除ボタンの遷移先が正しいこと" do
          expect(current_path).to eq posts_path
        end

        it "削除ボタン後のフラッシュが正しいこと" do
          expect(page).to have_content "投稿を削除しました。"
        end

        it "削除ボタンで投稿を削除できること" do
          expect(Post.all.count).to eq 0
        end
      end
    end
  end
end
