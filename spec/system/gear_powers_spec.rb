require 'rails_helper'

RSpec.describe "GearPowers", type: :system do
  describe "#index" do
    let!(:gear_power1) { create(:gear_power1) }
    let!(:gear_power2) { create(:gear_power2) }

    before do
      visit gear_powers_path
    end

    it "パンくずを正しく表示していること" do
      within ".breadcrumbs" do
        expect(page).to have_css "i.fa-solid"
        expect(page).to have_css "i.fa-house"
        expect(page).to have_content "Home"
        expect(page).to have_content "ギアパワー"
        expect(page).to have_css "span.current"
      end
    end

    it "パンくずで正しく遷移すること" do
      within ".breadcrumbs" do
        click_link "Home"
        expect(current_path).to eq root_path
      end
    end

    it "ギアパワーを全件表示していること" do
      expect(page).to have_content gear_power1.name
      expect(page).to have_content gear_power2.name
    end

    it "ギアパワーの各情報を表示していること" do
      expect(page).to have_content gear_power1.effect
      expect(page).to have_content "・" + gear_power1.easy_brand1
      expect(page).to have_content "・" + gear_power1.easy_brand2
      expect(page).to have_content "・" + gear_power1.hard_brand1
      expect(page).to have_content "・" + gear_power1.hard_brand2
      expect(page).to have_content gear_power1.main_part
      expect(page).to have_content gear_power1.abbreviation
      expect(page).to have_content "なし"
    end

    it "ギアパワーのアイコン画像を表示していること" do
      expect(page).to have_selector "img[src$='gear_power_#{gear_power1.id}.png']"
    end

    it "ギアパワー名をクリックすると個別へ遷移すること" do
      click_link gear_power1.name
      expect(current_path).to eq gear_power_path(gear_power1)
    end

    it "ギアパワー画像をクリックすると個別へ遷移すること" do
      click_link gear_power1.name + "のアイコン"
      expect(current_path).to eq gear_power_path(gear_power1)
    end
  end
end
