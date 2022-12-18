require 'rails_helper'

RSpec.describe "Contacts", type: :system do
  describe "#new" do
    before do
      visit new_contact_path
    end

    it "名前が未入力だとバリデーションにひっかかること" do
      fill_in "contact[email]", with: "test@gmail.com"
      fill_in "contact[message]", with: "テストメッセージです。"
      click_button "確認画面へ   >"
      expect(page).to have_content "お名前を入力してください"
    end

    it "お問い合わせ内容が未入力だとバリデーションにひっかかること" do
      fill_in "contact[name]", with: "テストユーザー"
      fill_in "contact[email]", with: "test@gmail.com"
      click_button "確認画面へ   >"
      expect(page).to have_content "お問い合わせ内容を入力してください"
    end

    it "入力に問題がなければ、confirmページに遷移し、入力値が表示されていること" do
      fill_in "contact[name]", with: "テストユーザー"
      fill_in "contact[email]", with: "test@gmail.com"
      fill_in "contact[message]", with: "テストメッセージです。"
      click_button "確認画面へ   >"
      expect(current_path).to eq confirm_contacts_path
      expect(page).to have_content "テストユーザー"
      expect(page).to have_content "test@gmail.com"
      expect(page).to have_content "テストメッセージです。"
    end

    it "confirmページから修正に戻れること" do
      fill_in "contact[name]", with: "テストユーザー"
      fill_in "contact[email]", with: "test@gmail.com"
      fill_in "contact[message]", with: "テストメッセージです。"
      click_button "確認画面へ   >"
      click_button "<   修正する"
      expect(current_path).to eq back_contacts_path
      expect(page).to have_xpath "//input[@id='contact_name'][@value='テストユーザー']"
      expect(page).to have_xpath "//input[@id='contact_email'][@value='test@gmail.com']"
      expect(page).to have_content "テストメッセージです。"
    end

    it "confirmページからdoneページに遷移し、入力値がDB保存されていること" do
      fill_in "contact[name]", with: "テストユーザー"
      fill_in "contact[email]", with: "test@gmail.com"
      fill_in "contact[message]", with: "テストメッセージです。"
      click_button "確認画面へ   >"
      click_button "送信する   >"
      expect(current_path).to eq done_contacts_path
      expect(Contact.all.count).to eq 1
    end
  end
end
