FactoryBot.define do
  factory :gear_power1, class: "GearPower" do
    name { "ラストスパート" }
    effect { "対戦終了の30カウント前からインク効率とインク回復速度がかなりアップします。" }
    easy_brand1 { "バトロイカ" }
    easy_brand2 { "クラーゲス" }
    hard_brand1 { "エンペリー" }
    hard_brand2 { "ロッケンベルグ" }
    main_part { "アタマ" }
    abbreviation { "ラスパ" }

    factory :gear_power2 do
      name { "相手インク影響軽減" }
      effect { "相手のインクをふんだ時のダメージや移動速度の減少量が少なくなります。" }
      easy_brand1 { "" }
      easy_brand2 { "" }
      hard_brand1 { "" }
      hard_brand2 { "" }
    end
  end
end
