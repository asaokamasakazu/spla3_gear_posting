class Post < ApplicationRecord
  validates :title, { presence: true, length: { maximum: 20 } }
  validates :weapon, { presence: true }
  validates :battle, { presence: true }
  validates :comment, { length: { maximum: 250 } }
  validates :head_main, { presence: true }
  validates :head_sub1, { presence: true }
  validates :head_sub2, { presence: true }
  validates :head_sub3, { presence: true }
  validates :body_main, { presence: true }
  validates :body_sub1, { presence: true }
  validates :body_sub2, { presence: true }
  validates :body_sub3, { presence: true }
  validates :shoes_main, { presence: true }
  validates :shoes_sub1, { presence: true }
  validates :shoes_sub2, { presence: true }
  validates :shoes_sub3, { presence: true }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :favorites, -> { order(created_at: :desc).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size } }

  SELECT_WEAPON_OPTIONS = [
    [
      "シューター",
      [
        "わかばシューター",
        "ヒーローシューターレプリカ",
        "スプラシューター",
        "プロモデラーMG",
        "N-ZAP85",
        "プライムシューター",
        "ボールドマーカー",
        "52ガロン",
        "L3リールガン",
        "ジェットスイーパー",
        "シャープマーカー",
        "96ガロン",
        "ボトルガイザー",
        "H3リールガン",
      ],
    ],
    [
      "チャージャー",
      [
        "スプラチャージャー",
        "スクイックリンα",
        "スプラスコープ",
        "リッター4K",
        "14式竹筒銃・甲",
        "ソイチューバー",
        "4Kスコープ",
      ],
    ],
    [
      "プラスター",
      [
        "ホットブラスター",
        "ラピッドブラスター",
        "ロングブラスター",
        "ノヴァブラスター",
        "クラッシュブラスター",
        "Rブラスターエリート",
      ],
    ],
    [
      "ローラー",
      [
        "スプラローラー",
        "カーボンローラー",
        "ダイナモローラー",
        "ヴァリアブルローラー",
      ],
    ],
    [
      "フデ",
      [
        "ホクサイ",
        "パブロ",
      ],
    ],
    [
      "スロッシャー",
      [
        "バケットスロッシャー",
        "ヒッセン",
        "スクリュースロッシャー",
        "オーバーフロッシャー",
        "エクスプロッシャー",
      ],
    ],
    [
      "スピナー",
      [
        "バレルスピナー",
        "スプラスピナー",
        "ハイドラント",
        "ノーチラス47",
        "クーゲルシュライバー",
      ],
    ],
    [
      "マニューバー",
      [
        "スプラマニューバー",
        "デュアルスイーパー",
        "スパッタリー",
        "クアッドホッパーブラック",
        "ケルビン525",
      ],
    ],
    [
      "シェルター",
      [
        "パラシェルター",
        "キャンピングシェルター",
        "スパイガジェット",
      ],
    ],
    [
      "ワイパー",
      [
        "ドライブワイパー",
        "ジムワイパー",
      ],
    ],
    [
      "ストリンガー",
      [
        "トライストリンガー",
        "LACT450",
      ],
    ],
  ].freeze

  SELECT_WEAPON_OPTIONS_FOR_SEARCH = [
    [
      "",
      [
        ["未選択", ""],
      ],
    ],
    [
      "シューター",
      [
        "わかばシューター",
        "ヒーローシューターレプリカ",
        "スプラシューター",
        "プロモデラーMG",
        "N-ZAP85",
        "プライムシューター",
        "ボールドマーカー",
        "52ガロン",
        "L3リールガン",
        "ジェットスイーパー",
        "シャープマーカー",
        "96ガロン",
        "ボトルガイザー",
        "H3リールガン",
      ],
    ],
    [
      "チャージャー",
      [
        "スプラチャージャー",
        "スクイックリンα",
        "スプラスコープ",
        "リッター4K",
        "14式竹筒銃・甲",
        "ソイチューバー",
        "4Kスコープ",
      ],
    ],
    [
      "プラスター",
      [
        "ホットブラスター",
        "ラピッドブラスター",
        "ロングブラスター",
        "ノヴァブラスター",
        "クラッシュブラスター",
        "Rブラスターエリート",
      ],
    ],
    [
      "ローラー",
      [
        "スプラローラー",
        "カーボンローラー",
        "ダイナモローラー",
        "ヴァリアブルローラー",
      ],
    ],
    [
      "フデ",
      [
        "ホクサイ",
        "パブロ",
      ],
    ],
    [
      "スロッシャー",
      [
        "バケットスロッシャー",
        "ヒッセン",
        "スクリュースロッシャー",
        "オーバーフロッシャー",
        "エクスプロッシャー",
      ],
    ],
    [
      "スピナー",
      [
        "バレルスピナー",
        "スプラスピナー",
        "ハイドラント",
        "ノーチラス47",
        "クーゲルシュライバー",
      ],
    ],
    [
      "マニューバー",
      [
        "スプラマニューバー",
        "デュアルスイーパー",
        "スパッタリー",
        "クアッドホッパーブラック",
        "ケルビン525",
      ],
    ],
    [
      "シェルター",
      [
        "パラシェルター",
        "キャンピングシェルター",
        "スパイガジェット",
      ],
    ],
    [
      "ワイパー",
      [
        "ドライブワイパー",
        "ジムワイパー",
      ],
    ],
    [
      "ストリンガー",
      [
        "トライストリンガー",
        "LACT450",
      ],
    ],
  ].freeze
end
