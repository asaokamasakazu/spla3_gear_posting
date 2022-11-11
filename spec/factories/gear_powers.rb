FactoryBot.define do
  factory :gear_power1, class: "GearPower" do
    name { Faker::Lorem.characters(number: 10) }
    effect { Faker::Lorem.characters(number: 20) }
    easy_brand1 { "バトロイカ" }
    easy_brand2 { "クラーゲス" }
    hard_brand1 { "エンペリー" }
    hard_brand2 { "ロッケンベルグ" }
    main_part { "アタマ" }
    abbreviation { "ラスパ" }

    factory :gear_power2 do
      easy_brand1 { "" }
      easy_brand2 { "" }
      hard_brand1 { "" }
      hard_brand2 { "" }
    end
  end
end
