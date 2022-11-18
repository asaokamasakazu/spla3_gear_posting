require 'rails_helper'

RSpec.describe "Users", type: :system do
  def click_checkbox_once
    check "パスワードを表示する"
    expect(page).to have_xpath "//input[@id='input_pass'][@type='text']"
  end

  def click_checkbox_twice
    check "パスワードを表示する"
    uncheck "パスワードを表示する"
    expect(page).to have_xpath "//input[@id='input_pass'][@type='password']"
  end

  describe "#list" do
    let!(:user1) { create(:user, name: "サンプル1", prowess: "A+") }
    let!(:user2) { create(:user, name: "サンプル2", prowess: "B-") }
    let(:user3) { create(:user, name: "ゲスト1", prowess: "C") }
    let(:post) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user3) }
    let!(:favorite) { create(:favorite, user: user3, post: post) }

    before do
      visit list_users_path
    end

    describe "パンくずのテスト" do
      it "パンくずを正しく表示していること" do
        within ".breadcrumbs" do
          expect(page).to have_css "i.fa-solid"
          expect(page).to have_css "i.fa-house"
          expect(page).to have_content "Home"
          expect(page).to have_content "ユーザー"
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
      it "ユーザーを全件表示していること" do
        expect(page).to have_content user1.name
        expect(page).to have_content user2.name
      end

      it "ユーザーの各情報を表示していること" do
        expect(page).to have_content user1.rank
        expect(page).to have_content user1.prowess
        expect(page).to have_content "投稿数 1"
        expect(page).to have_content "被お気に入り数 1"
      end

      it "ユーザーのアイコンを表示していること" do
        expect(page).to have_selector "img[src$='user_image_default_ye.png']"
      end

      it "ユーザー名をクリックするとユーザー詳細ページへ遷移すること" do
        click_link user1.name
        expect(current_path).to eq user_path(user1)
      end

      it "ユーザーアイコンをクリックするとユーザー詳細ページへ遷移すること" do
        click_link "デフォルトユーザーアイコン", match: :first
        expect(current_path).to eq user_path(user3)
      end

      it "「プロフィールへ」をクリックするとユーザー詳細ページへ遷移すること" do
        click_link "> プロフィールへ", match: :first
        expect(current_path).to eq user_path(user3)
      end
    end

    describe "検索機能のテスト" do
      it "検索後の遷移先が正しいこと" do
        within ".main-container" do
          click_button "検索"
        end
        expect(current_path).to eq search_users_path
      end

      it "ユーザー名検索でユーザーを絞り込めること" do
        fill_in "q[name_cont]", with: "サンプル"
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).to have_content user2.name
        expect(page).not_to have_content user3.name
      end

      it "ウデマエ検索でユーザーを絞り込めること" do
        within ".main-container" do
          uncheck "B"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).to have_content user3.name
        expect(page).not_to have_content user2.name
      end

      it "ユーザー名検索とウデマエ検索を併用してユーザーを絞り込めること" do
        fill_in "q[name_cont]", with: "サンプル"
        within ".main-container" do
          uncheck "B"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).not_to have_content user2.name
        expect(page).not_to have_content user3.name
      end

      it "デフォルトの状態で検索するとユーザーが全件表示されること" do
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).to have_content user2.name
        expect(page).to have_content user3.name
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
        expect(page).to have_content "条件に一致するユーザーはいません。"
      end
    end
  end

  describe "#search" do
    let!(:user1) { create(:user, name: "サンプル1", prowess: "A+") }
    let!(:user2) { create(:user, name: "サンプル2", prowess: "B-") }
    let!(:user3) { create(:user, name: "ゲスト1", prowess: "C") }

    before do
      visit search_users_path
    end

    describe "パンくずのテスト" do
      it "パンくずを正しく表示していること" do
        within ".breadcrumbs" do
          expect(page).to have_css "i.fa-solid"
          expect(page).to have_css "i.fa-house"
          expect(page).to have_content "Home"
          expect(page).to have_content "ユーザー"
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
      it "ダイレクトで訪れた場合は全ユーザーを表示していること" do
        expect(page).to have_content user1.name
        expect(page).to have_content user2.name
        expect(page).to have_content user3.name
      end

      it "検索後の遷移先が正しいこと" do
        within ".main-container" do
          click_button "検索"
        end
        expect(current_path).to eq search_users_path
      end

      it "ユーザー名検索でユーザーを絞り込めること" do
        fill_in "q[name_cont]", with: "サンプル"
        within ".main-container" do
          check "S"
          check "A"
          check "B"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).to have_content user2.name
        expect(page).not_to have_content user3.name
      end

      it "ウデマエ検索でユーザーを絞り込めること" do
        within ".main-container" do
          check "S"
          check "A"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).to have_content user3.name
        expect(page).not_to have_content user2.name
      end

      it "ユーザー名検索とウデマエ検索を併用してユーザーを絞り込めること" do
        fill_in "q[name_cont]", with: "サンプル"
        within ".main-container" do
          check "S"
          check "A"
          check "C"
          check "未設定"
          click_button "検索"
        end
        expect(page).to have_content user1.name
        expect(page).not_to have_content user2.name
        expect(page).not_to have_content user3.name
      end

      it "デフォルトの状態で検索するとユーザーが表示されないこと" do
        within ".main-container" do
          click_button "検索"
        end
        expect(page).not_to have_content user1.name
        expect(page).not_to have_content user2.name
        expect(page).not_to have_content user3.name
      end

      it "該当するユーザーがいなかった場合に、メッセージが表示されること" do
        within ".main-container" do
          click_button "検索"
        end
        expect(page).to have_content "条件に一致するユーザーはいません。"
      end
    end
  end

  describe "#show" do
    let(:user) { create(:user, rank: "3", prowess: "A+") }
    let(:no_post_user) { create(:user) }
    let!(:post1) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user) }
    let(:post2) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ", user: user) }
    let(:post3) { create(:post, weapon: "わかばシューター", battle: "ガチヤグラ") }
    let!(:favorite1) { create(:favorite, user: user, post: post2) }
    let!(:favorite2) { create(:favorite, user: user, post: post3) }

    describe "パンくずのテスト" do
      before do
        visit user_path(user)
      end

      it "パンくずを正しく表示していること" do
        within ".breadcrumbs" do
          expect(page).to have_css "i.fa-solid"
          expect(page).to have_css "i.fa-house"
          expect(page).to have_content "Home"
          expect(page).to have_content "ユーザー"
          expect(page).to have_content user.name
          expect(page).to have_css "span.current"
        end
      end

      it "パンくずのHomeをクリックするとトップページへ遷移すること" do
        within ".breadcrumbs" do
          click_link "Home"
          expect(current_path).to eq root_path
        end
      end

      it "パンくずのユーザーをクリックするとユーザー一覧へ遷移すること" do
        within ".breadcrumbs" do
          click_link "ユーザー"
          expect(current_path).to eq list_users_path
        end
      end
    end

    describe "ユーザー情報部分のテスト" do
      before do
        visit user_path(user)
      end

      it "ユーザーのアイコンを表示していること" do
        within ".title-container" do
          expect(page).to have_selector "img[src$='user_image_default_ye.png']"
        end
      end

      it "ユーザーの登録情報を表示していること" do
        within ".title-container" do
          expect(page).to have_selector "h2", text: user.name
          expect(page).to have_content user.profile
        end
        within ".title-container-footer" do
          expect(page).to have_content user.rank
          expect(page).to have_content user.prowess
          expect(page).to have_content "2" # 投稿数
          expect(page).to have_content "1" # 被お気に入り数
        end
      end

      context "まだログインしていない場合" do
        it "プロフィール編集ボタンを表示していないこと" do
          expect(page).not_to have_link "プロフィールを編集"
        end
      end

      context "すでにログインしている場合" do
        before do
          sign_in user
          visit user_path(user)
        end

        it "プロフィール編集ボタンを表示していること" do
          expect(page).to have_link "プロフィールを編集"
        end

        it "プロフィール編集ボタンの遷移先が正しいこと" do
          click_link "プロフィールを編集"
          expect(current_path).to eq edit_user_registration_path
        end
      end
    end

    describe "トグルのテスト", js: true do
      before do
        visit user_path(user)
      end

      it "初期状態では投稿側が表示され、お気に入り側が表示されていないこと" do
        expect(page).to have_content post1.title
        expect(page).not_to have_content post3.title
      end

      it "お気に入りをクリックすると表示が切り替わること" do
        find('label[for=toggle_favorites]').click
        expect(page).not_to have_content post1.title
        expect(page).to have_content post3.title
      end

      it "お気に入りクリック後に投稿をクリックすると表示が再度切り替わること" do
        find('label[for=toggle_favorites]').click
        find('label[for=toggle_posts]').click
        expect(page).to have_content post1.title
        expect(page).not_to have_content post3.title
      end
    end

    describe "投稿部分のテスト" do
      context "投稿がない場合" do
        it "投稿がないことを示す文章を表示していること" do
          visit user_path(no_post_user)
          expect(page).to have_content "まだ投稿はありません。"
        end

        it "マイページなら投稿するボタンを表示していること" do
          sign_in no_post_user
          visit user_path(no_post_user)
          within ".main-container" do
            expect(page).to have_content "＋投稿する"
          end
        end

        it "マイページではないなら投稿するボタンを表示していないこと" do
          visit user_path(no_post_user)
          within ".main-container" do
            expect(page).not_to have_content "＋投稿する"
          end
        end
      end

      context "投稿がある場合" do
        it "これまでの投稿を表示していること" do
          visit user_path(user)
          expect(page).to have_content post1.title
          expect(page).to have_content post2.title
        end
      end
    end
  end

  describe "#account" do
    let(:user) { create(:user, prowess: "A+") }

    context "まだログインしていない場合" do
      before do
        visit account_users_path
      end

      it "アカウントページに遷移したらログインページへリダイレクトすること" do
        expect(current_path).to eq new_user_session_path
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "アカウント登録もしくはログインしてください。"
      end
    end

    context "すでにログインしている場合" do
      before do
        sign_in user
        visit account_users_path
      end

      describe "パンくずのテスト" do
        it "パンくずを正しく表示していること" do
          within ".breadcrumbs" do
            expect(page).to have_css "i.fa-solid"
            expect(page).to have_css "i.fa-house"
            expect(page).to have_content "Home"
            expect(page).to have_content "アカウント情報"
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

      describe "ユーザー情報部分のテスト" do
        it "ユーザーのアイコンを表示していること" do
          within ".main-container" do
            expect(page).to have_selector "img[src$='user_image_default_bk.png']"
          end
        end

        it "ユーザーの登録情報を表示していること" do
          within ".main-container" do
            expect(page).to have_content user.name
            expect(page).to have_content user.profile
            expect(page).to have_content user.rank
            expect(page).to have_content user.prowess
            expect(page).to have_content user.email
          end
        end
      end
    end
  end

  describe "#edit" do
    let(:user) { create(:user, prowess: "A+") }

    context "まだログインしていない場合" do
      before do
        visit edit_user_registration_path
      end

      it "アカウントページに遷移したらログインページへリダイレクトすること" do
        expect(current_path).to eq new_user_session_path
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "アカウント登録もしくはログインしてください。"
      end
    end

    context "すでにログインしている場合" do
      before do
        sign_in user
        visit edit_user_registration_path
      end

      describe "ユーザー情報部分のテスト" do
        context "更新に成功する場合" do
          it "更新後にユーザー詳細ページへリダイレクトすること" do
            click_button "更新する"
            expect(current_path).to eq user_path(user)
          end

          it "リダイレクト後に正しいフラッシュを表示していること" do
            click_button "更新する"
            expect(page).to have_content "アカウント情報を変更しました。"
          end

          it "登録済みの情報がフォームに表示されていること" do
            within ".main-container" do
              expect(page).to have_xpath "//input[@id='user_name'][@value='#{user.name}']"
              expect(page).to have_content user.profile
              expect(page).to have_xpath "//input[@id='user_rank'][@value='#{user.rank}']"
              expect(page).to have_xpath "//option[@selected='selected'][@value='#{user.prowess}']"
              expect(page).to have_xpath "//input[@id='user_email'][@value='#{user.email}']"
            end
          end

          it "ユーザー名の変更ができること" do
            fill_in "user[name]", with: "edited_name"
            click_button "更新する"
            expect(User.find(user.id).name).to eq "edited_name"
          end

          it "プロフィールの変更ができること" do
            fill_in "user[profile]", with: "edited_profile"
            click_button "更新する"
            expect(User.find(user.id).profile).to eq "edited_profile"
          end

          it "ランクの変更ができること" do
            fill_in "user[rank]", with: 7
            click_button "更新する"
            expect(User.find(user.id).rank).to eq 7
          end

          it "ウデマエの変更ができること" do
            select "S+", from: "user[prowess]"
            click_button "更新する"
            expect(User.find(user.id).prowess).to eq "S+"
          end

          it "メールアドレスの変更ができること" do
            fill_in "user[email]", with: "edited@email.com"
            click_button "更新する"
            expect(User.find(user.id).email).to eq "edited@email.com"
          end

          it "パスワードの変更ができること" do
            fill_in "user[password]", with: "edited_pass"
            fill_in "user[password_confirmation]", with: "edited_pass"
            click_button "更新する"
            expect(User.find(user.id).valid_password?("edited_pass")).to be_truthy
          end

          it "ユーザーアイコンの変更ができること" do
            attach_file "user[image]", "#{Rails.root}/spec/fixtures/files/test_image.png"
            click_button "更新する"
            expect(page).to have_selector "img[src$='test_image.png']"
          end
        end

        context "更新に失敗する場合" do
          def password_update_fails
            fill_in "user[password]", with: "edited_pass"
            fill_in "user[password_confirmation]", with: "edited_passssss"
            click_button "更新する"
          end

          it "パスワードと確認用パスワードが異なると更新に失敗すること" do
            password_update_fails
            expect(User.find(user.id).valid_password?(user.password)).to be_truthy
          end

          it "更新失敗後の遷移先が正しいこと" do
            password_update_fails
            expect(current_path).to eq "/users"
          end

          it "更新失敗後に正しいフラッシュを表示していること" do
            password_update_fails
            expect(page).to have_content "パスワード (確認用)とパスワードの入力が一致しません。"
          end

          it "更新失敗後の、入力していた情報の引継ぎが正しいこと" do
            fill_in "user[email]", with: "edited@email.com"
            password_update_fails
            expect(page).to have_xpath "//input[@id='user_email'][@value='edited@email.com']"
            expect(page).not_to have_content "edited_pass"
            expect(page).not_to have_content "edited_passssss"
          end
        end
      end

      describe "変更したユーザーアイコンのテスト" do
        before do
          attach_file "user[image]", "#{Rails.root}/spec/fixtures/files/test_image.png"
          click_button "更新する"
        end

        it "ヘッダーに変更後のアイコンが反映されること" do
          # ヘッダー調整後に記述する
        end

        it "ユーザー一覧ページに変更後のアイコンが反映されること" do
          visit list_users_path
          within ".main-container" do
            expect(page).to have_selector "img[src$='test_image.png']"
          end
        end

        it "ユーザー検索ページに変更後のアイコンが反映されること" do
          visit search_users_path
          within ".main-container" do
            expect(page).to have_selector "img[src$='test_image.png']"
          end
        end

        it "ユーザー詳細ページに変更後のアイコンが反映されること" do
          visit user_path(user)
          within ".title-container" do
            expect(page).to have_selector "img[src$='test_image.png']"
          end
        end

        it "ユーザーアカウントページに変更後のアイコンが反映されること" do
          visit account_users_path
          within ".main-container" do
            expect(page).to have_selector "img[src$='test_image.png']"
          end
        end
      end

      describe "パスワードを表示するチェックボックスのテスト", js: true do
        it "チェックボックスを1回クリックするとパスワードが表示されること" do
          click_checkbox_once
        end

        it "チェックボックスを2回クリックするとパスワードが再び非表示になること" do
          click_checkbox_twice
        end
      end

      describe "ログアウトのテスト" do
        before do
          within ".under-forms" do
            click_link "ログアウト"
          end
        end

        it "ログアウト後の遷移先が正しいこと" do
          expect(current_path).to eq root_path
        end

        it "ログイン成功後に正しいフラッシュを表示していること" do
          expect(page).to have_content "ログアウトしました。"
        end

        it "ログインが必要なページにアクセスできず、リダイレクトすること" do
          visit edit_user_registration_path
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content "アカウント登録もしくはログインしてください。"
        end
      end

      describe "退会のテスト" do
        before do
          within ".under-forms" do
            click_link "退会（アカウント削除）"
          end
        end

        it "退会後の遷移先が正しいこと" do
          expect(current_path).to eq root_path
        end

        it "退会成功後に正しいフラッシュを表示していること" do
          expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
        end

        it "ログインが必要なページにアクセスできず、リダイレクトすること" do
          visit edit_user_registration_path
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content "アカウント登録もしくはログインしてください。"
        end

        it "dbからデータがdeleteされていること" do
          expect(User.all.count).to eq 0
        end
      end
    end
  end

  describe "#sign_up" do
    let(:user) { create(:user) }
    let!(:guest_user) { create(:user, email: "guest@example.com") }

    context "まだログインしていない場合" do
      before do
        visit new_user_registration_path
      end

      describe "パンくずのテスト" do
        it "パンくずを正しく表示していること" do
          within ".breadcrumbs" do
            expect(page).to have_css "i.fa-solid"
            expect(page).to have_css "i.fa-house"
            expect(page).to have_content "Home"
            expect(page).to have_content "ユーザー登録"
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

      describe "新規登録のテスト" do
        context "新規登録に成功した場合" do
          before do
            fill_in "user[name]", with: "テストさん"
            fill_in "user[email]", with: "sample_email@sample.com"
            fill_in "user[password]", with: "sample_password"
            fill_in "user[password_confirmation]", with: "sample_password"
            click_button "新規登録する"
          end

          it "新規登録成功後の遷移先が正しいこと" do
            new_user_id = User.maximum("id")
            expect(current_path).to eq user_path(new_user_id)
          end

          it "新規登録成功後に正しいフラッシュを表示していること" do
            expect(page).to have_content "アカウント登録が完了しました。"
          end
        end

        context "新規登録に失敗した場合" do
          it "新規登録失敗後の遷移先が正しいこと" do
            fill_in "user[name]", with: "テストさん"
            fill_in "user[email]", with: "sample_email@sample.com"
            fill_in "user[password]", with: "sample_password"
            fill_in "user[password_confirmation]", with: "sample_password2"
            click_button "新規登録する"
            expect(current_path).to eq "/users"
          end

          it "すでに存在するメールアドレスでは新規登録できないこと" do
            fill_in "user[name]", with: "テストさん"
            fill_in "user[email]", with: user.email
            fill_in "user[password]", with: "sample_password"
            fill_in "user[password_confirmation]", with: "sample_password"
            click_button "新規登録する"
            expect(page).to have_content "メールアドレスはすでに存在します。"
            expect(User.all.count).to eq 2
          end

          it "パスワードと確認用パスワードが異なると新規登録できないこと" do
            fill_in "user[name]", with: "テストさん"
            fill_in "user[email]", with: "sample_email@sample.com"
            fill_in "user[password]", with: "sample_password"
            fill_in "user[password_confirmation]", with: "sample_password2"
            click_button "新規登録する"
            expect(page).to have_content "パスワード (確認用)とパスワードの入力が一致しません。"
            expect(User.all.count).to eq 1
          end

          it "新規登録失敗後の、入力していた情報の引継ぎが正しいこと" do
            fill_in "user[name]", with: "テストさん"
            fill_in "user[email]", with: "sample_email@sample.com"
            fill_in "user[password]", with: "sample_password"
            fill_in "user[password_confirmation]", with: "sample_password2"
            click_button "新規登録する"
            expect(page).to have_xpath "//input[@id='user_name'][@value='テストさん']"
            expect(page).to have_xpath "//input[@id='user_email'][@value='sample_email@sample.com']"
            expect(page).not_to have_content "sample_password"
            expect(page).not_to have_content "sample_password2"
          end
        end

        context "ゲストログインした場合" do
          before do
            within ".under-forms" do
              click_link "ゲストログイン"
            end
          end

          it "ログイン成功後の遷移先が正しいこと" do
            expect(current_path).to eq user_path(guest_user)
          end

          it "ログイン成功後に正しいフラッシュを表示していること" do
            expect(page).to have_content "ゲストユーザーとしてログインしました。"
          end
        end
      end

      describe "パスワードを表示するチェックボックスのテスト", js: true do
        it "チェックボックスを1回クリックするとパスワードが表示されること" do
          click_checkbox_once
        end

        it "チェックボックスを2回クリックするとパスワードが再び非表示になること" do
          click_checkbox_twice
        end
      end
    end

    context "すでにログインしている場合" do
      before do
        sign_in user
        visit new_user_registration_path
      end

      it "新規登録ページに遷移したらTOPへリダイレクトすること" do
        expect(current_path).to eq root_path
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "すでにログインしています。"
      end
    end
  end

  describe "#sign_in" do
    let(:user) { create(:user) }
    let!(:guest_user) { create(:user, email: "guest@example.com") }

    context "まだログインしていない場合" do
      before do
        visit new_user_session_path
      end

      describe "パンくずのテスト" do
        it "パンくずを正しく表示していること" do
          within ".breadcrumbs" do
            expect(page).to have_css "i.fa-solid"
            expect(page).to have_css "i.fa-house"
            expect(page).to have_content "Home"
            expect(page).to have_content "ログイン"
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

      describe "ログインのテスト" do
        context "ログインに成功した場合" do
          before do
            fill_in "user[email]", with: user.email
            fill_in "user[password]", with: user.password
            click_button "ログインする"
          end

          it "ログイン成功後の遷移先が正しいこと" do
            expect(current_path).to eq user_path(user)
          end

          it "ログイン成功後に正しいフラッシュを表示していること" do
            expect(page).to have_content "ログインしました。"
          end
        end

        context "ログインに失敗した場合" do
          before do
            fill_in "user[email]", with: "sample_email@sample.com"
            fill_in "user[password]", with: "sample_password"
            click_button "ログインする"
          end

          it "ログイン失敗後の遷移先が正しいこと" do
            expect(current_path).to eq new_user_session_path
          end

          it "ログイン失敗後に正しいフラッシュを表示していること" do
            expect(page).to have_content "メールアドレスまたはパスワードが違います。"
          end

          it "ログイン失敗後の、入力していた情報の引継ぎが正しいこと" do
            expect(page).to have_xpath "//input[@id='user_email'][@value='sample_email@sample.com']"
            expect(page).not_to have_content "sample_password"
          end
        end

        context "ゲストログインした場合" do
          before do
            within ".under-forms" do
              click_link "ゲストログイン"
            end
          end

          it "ログイン成功後の遷移先が正しいこと" do
            expect(current_path).to eq user_path(guest_user)
          end

          it "ログイン成功後に正しいフラッシュを表示していること" do
            expect(page).to have_content "ゲストユーザーとしてログインしました。"
          end
        end
      end

      describe "パスワードを表示するチェックボックスのテスト", js: true do
        it "チェックボックスを1回クリックするとパスワードが表示されること" do
          click_checkbox_once
        end

        it "チェックボックスを2回クリックするとパスワードが再び非表示になること" do
          click_checkbox_twice
        end
      end
    end

    context "すでにログインしている場合" do
      before do
        sign_in user
        visit new_user_session_path
      end

      it "ログインページに遷移したらユーザー詳細ページへリダイレクトすること" do
        expect(current_path).to eq user_path(user)
      end

      it "リダイレクト後に正しいフラッシュを表示していること" do
        expect(page).to have_content "すでにログインしています。"
      end
    end
  end
end
