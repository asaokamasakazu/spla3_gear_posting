require 'rails_helper'

RSpec.describe "GearPowers", type: :request do
  describe "GET /index" do
    let!(:gear_power1) { create(:gear_power1) }
    let!(:gear_power2) { create(:gear_power2) }

    before do
      get gear_powers_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "ギアパワーを全件取得していること" do
      expect(response.body).to include gear_power1.name
      expect(response.body).to include gear_power2.name
    end

    it "ギアパワーの各情報を取得していること" do
      expect(response.body).to include gear_power1.effect
      expect(response.body).to include "・" + gear_power1.easy_brand1
      expect(response.body).to include "・" + gear_power1.easy_brand2
      expect(response.body).to include "・" + gear_power1.hard_brand1
      expect(response.body).to include "・" + gear_power1.hard_brand2
      expect(response.body).to include gear_power1.main_part
      expect(response.body).to include gear_power1.abbreviation
      expect(response.body).to include "なし"
    end

    it "ギアパワーのアイコン画像を取得していること" do
      expect(response.body).to include "gear_power_#{gear_power1.id}.png"
    end
  end
end
