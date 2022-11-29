User.create!([
  {email: "alicealicealice@gmail.com", password: "alice_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Alice", rank: 2, prowess: "C-", profile: "アリスと申します。"},
  {email: "bobbobbob@yahoo.co.jp", password: "bob_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Bob", rank: 93, prowess: "B-", profile: ""},
  {email: "cameroncameroncameron@gmail.com", password: "cameron_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Cameron", rank: 20, prowess: "B-", profile: "はじめまして。cameronです。よろしくお願いします。"},
  {email: "daviddaviddavid@gmail.com", password: "david_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "David", rank: 15, prowess: "A+", profile: "東京都出身のDavidです。"},
  {email: "edwardedwardedward@gmail.com", password: "edward_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Edward", rank: 30, prowess: "S+", profile: ""},
  {email: "frankiefrankiefrankie@gmail.com", password: "frankie_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Frankie", rank: 7, prowess: "C", profile: ""},
  {email: "george@yahoo.co.jp", password: "george_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "George", rank: 50, prowess: "S+", profile: "Georgeです。"},
  {email: "howard@yahoo.co.jp", password: "howard_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Howard", rank: 70, prowess: "S+", profile: "スプラは初代からやってます。よろしくお願いします。"},
  {email: "issac@yahoo.co.jp", password: "issac_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Issac", rank: 35, prowess: "A+", profile: "一生Aランク帯でやってます。プレイは主に夜がメイン。"},
  {email: "james@yahoo.co.jp", password: "james_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "James", rank: 87, prowess: "A", profile: "スプラ歴3ヶ月の初心者です。"},
  {email: "kevin@yahoo.co.jp", password: "kevin_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Kevin", rank: 81, prowess: "S", profile: "閲覧ありがとうございます。Kevinです。シューターが好きなので、シューター向けの編成をよく投稿しています。"},
  {email: "larry@yahoo.co.jp", password: "larry_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Larry", rank: 39, prowess: "C+", profile: "チャージャー好きです！"},
  {email: "michael@icloud.com", password: "michael_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Michael", rank: 26, prowess: "C-", profile: "サーモンランとヒーローモードがメインです。"},
  {email: "nicholas@icloud.com", password: "nicholas_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Nicholas", rank: 88, prowess: "S+", profile: "S+で通用する編成を紹介しています。"},
  {email: "oscar@icloud.com", password: "oscar_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Oscar", rank: 17, prowess: "C", profile: "ボールドマーカーとスプラシューターをよく使います。チャージャーもできるようになりたいので、練習中です。"},
  {email: "peter@icloud.com", password: "peter_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Peter", rank: 51, prowess: "B+", profile: "スプラにハマったので始めてみました。"},
  {email: "quincy@icloud.com", password: "quincy_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Quincy", rank: 67, prowess: "A-", profile: "クラッシュブラスター縛りでやってます。"},
  {email: "robert@icloud.com", password: "robert_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Robert", rank: nil, prowess: "B+", profile: "初心者です。よろしくお願いいたします。"},
  {email: "stephen@icloud.com", password: "stephen_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Stephen", rank: 101, prowess: "未設定", profile: "皆さんはじめまして。Stephenと申します。"},
  {email: "tom@icloud.com", password: "tom_pass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "Tom", rank: nil, prowess: "未設定", profile: "スプラ始めたてです。"}
])
Favorite.create!([
  {user_id: 13, post_id: 23},
  {user_id: 13, post_id: 8},
  {user_id: 13, post_id: 6},
  {user_id: 13, post_id: 25},
  {user_id: 13, post_id: 22},
  {user_id: 13, post_id: 14},
  {user_id: 13, post_id: 9},
  {user_id: 6, post_id: 23},
  {user_id: 6, post_id: 22},
  {user_id: 6, post_id: 25},
  {user_id: 6, post_id: 14},
  {user_id: 6, post_id: 9},
  {user_id: 6, post_id: 26},
  {user_id: 6, post_id: 8},
  {user_id: 6, post_id: 11},
  {user_id: 6, post_id: 13},
  {user_id: 6, post_id: 16},
  {user_id: 6, post_id: 20},
  {user_id: 2, post_id: 8},
  {user_id: 2, post_id: 9},
  {user_id: 3, post_id: 8},
  {user_id: 3, post_id: 16},
  {user_id: 3, post_id: 19},
  {user_id: 3, post_id: 20},
  {user_id: 3, post_id: 17},
  {user_id: 3, post_id: 26},
  {user_id: 4, post_id: 8},
  {user_id: 4, post_id: 13},
  {user_id: 4, post_id: 14},
  {user_id: 4, post_id: 23},
  {user_id: 5, post_id: 8},
  {user_id: 5, post_id: 21},
  {user_id: 5, post_id: 20},
  {user_id: 5, post_id: 14},
  {user_id: 5, post_id: 26},
  {user_id: 5, post_id: 23},
  {user_id: 5, post_id: 11},
  {user_id: 5, post_id: 10},
  {user_id: 5, post_id: 18},
  {user_id: 17, post_id: 8},
  {user_id: 17, post_id: 14},
  {user_id: 17, post_id: 9},
  {user_id: 17, post_id: 23},
  {user_id: 17, post_id: 16},
  {user_id: 17, post_id: 26},
  {user_id: 18, post_id: 14},
  {user_id: 18, post_id: 9},
  {user_id: 18, post_id: 8}
])
GearPower.create!([
  {name: "メイン効率アップ", effect: "メインウェポンの消費インク量が少なくなります。", easy_brand1: "タタキケンサキ", easy_brand2: "ジモン", hard_brand1: "バトロイカ", hard_brand2: "", main_part: "すべて", abbreviation: "メイン効率"},
  {name: "サブ効率アップ", effect: "サブウェポンの消費インク量が少なくなります。", easy_brand1: "ホッコリー", easy_brand2: "アナアキ", hard_brand1: "フォーリマ", hard_brand2: "", main_part: "すべて", abbreviation: "サブ効率"},
  {name: "インク回復力アップ", effect: "インクタンク回復速度がアップします。", easy_brand1: "アロメ", easy_brand2: "", hard_brand1: "ホッコリー", hard_brand2: "", main_part: "すべて", abbreviation: "インク回復"},
  {name: "ヒト移動速度アップ", effect: "ヒト状態の移動速度がアップします。", easy_brand1: "ロッケンベルグ", easy_brand2: "", hard_brand1: "ジモン", hard_brand2: "", main_part: "すべて", abbreviation: "ヒト速"},
  {name: "イカダッシュ速度アップ", effect: "イカダッシュ時の移動速度がアップします。", easy_brand1: "クラーゲス", easy_brand2: "", hard_brand1: "ロッケンベルグ", hard_brand2: "", main_part: "すべて", abbreviation: "イカ速"},
  {name: "スペシャル増加量アップ", effect: "スペシャルゲージの増加量がアップします。", easy_brand1: "ヤコ", easy_brand2: "", hard_brand1: "エゾッコ", hard_brand2: "シチリン", main_part: "すべて", abbreviation: "スペ増"},
  {name: "スペシャル減少量ダウン", effect: "プレイヤーがやられた時のスペシャルゲージの減少量が少なくなります。", easy_brand1: "エゾッコ", easy_brand2: "", hard_brand1: "ホタックス", hard_brand2: "アナアキ", main_part: "すべて", abbreviation: "スペ減"},
  {name: "スペシャル性能アップ", effect: "スペシャルウェポンの性能がアップします。", easy_brand1: "フォーリマ", easy_brand2: "", hard_brand1: "ヤコ", hard_brand2: "", main_part: "すべて", abbreviation: "スペ性能"},
  {name: "復活時間短縮", effect: "相手を一人も倒せないまま連続でやられた時、復活時間が短くなります。", easy_brand1: "ホタックス", easy_brand2: "", hard_brand1: "アイロニック", hard_brand2: "", main_part: "すべて", abbreviation: "復短"},
  {name: "スーパージャンプ時間短縮", effect: "スーパージャンプの時間が短くなります。", easy_brand1: "アイロニック", easy_brand2: "", hard_brand1: "アロメ", hard_brand2: "", main_part: "すべて", abbreviation: "スパ短"},
  {name: "サブ性能アップ", effect: "サブウェポンの性能がアップします。", easy_brand1: "エンペリー", easy_brand2: "", hard_brand1: "タタキケンサキ", hard_brand2: "バラズシ", main_part: "すべて", abbreviation: "サブ性能"},
  {name: "相手インク影響軽減", effect: "相手のインクをふんだ時のダメージや移動速度の減少量が少なくなります。", easy_brand1: "バトロイカ", easy_brand2: "", hard_brand1: "エンペリー", hard_brand2: "", main_part: "すべて", abbreviation: "安全靴"},
  {name: "サブ影響軽減", effect: "サブウェポンによるダメージや効果を軽減します。", easy_brand1: "シグレニ", easy_brand2: "", hard_brand1: "クラーゲス", hard_brand2: "", main_part: "すべて", abbreviation: "サブ軽減"},
  {name: "アクション強化", effect: "イカロールやイカノボリが行いやすくなるとともに、ジャンプ直後に攻撃するときの射撃のブレが少なくなります。", easy_brand1: "バラズシ", easy_brand2: "シチリン", hard_brand1: "シグレニ", hard_brand2: "", main_part: "すべて", abbreviation: "アクション"},
  {name: "スタートダッシュ", effect: "対戦開始から30カウントの間移動に関する効果がかなりアップします。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "アタマ", abbreviation: "スタダ"},
  {name: "ラストスパート", effect: "対戦終了の30カウント前からインク効率とインク回復速度がかなりアップします。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "アタマ", abbreviation: "ラスパ"},
  {name: "逆境強化", effect: "自チームの人数が相手チームより少ない場合、少しずつスペシャルゲージが増えます。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "アタマ", abbreviation: "逆境"},
  {name: "カムバック", effect: "プレイヤーがやられて復帰後、しばらくの間一部の能力がかなりアップします。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "アタマ", abbreviation: "カムバ"},
  {name: "イカニンジャ", effect: "地面をイカダッシュした時にインクが飛び散らなくなるが、移動速度が少しダウンします。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "フク", abbreviation: "イカ忍"},
  {name: "リベンジ", effect: "復活したとき、自分を倒した相手の位置が遠くから見えるようになります。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "フク", abbreviation: "リベンジ"},
  {name: "サーマルインク", effect: "メインウェポンの弾を直接当てた相手が、しばらくの間遠くから見えるようになります。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "フク", abbreviation: "サーマル"},
  {name: "復活ペナルティアップ", effect: "自プレイヤーと倒した相手のスペシャル減少量と復活時間が増えます。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "フク", abbreviation: "ペナアップ"},
  {name: "追加ギアパワー倍化", effect: "このギアについている追加ギアパワーを1つで2コ分の効果にします。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "フク", abbreviation: "倍化"},
  {name: "ステルスジャンプ", effect: "スーパージャンプの着地点を示すマーカーが、はなれた場所から見えなくなります。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "クツ", abbreviation: "ステジャン"},
  {name: "対物攻撃力アップ", effect: "プレイヤー以外の物体に対して攻撃したときのダメージを増やします。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "クツ", abbreviation: "対物"},
  {name: "受け身術", effect: "スーパージャンプ着地時にスティックを倒しておくと着地と同時に前転します。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "クツ", abbreviation: "受け身"},
  {name: "？", effect: "ランダムなギアパワーが付きます。", easy_brand1: "", easy_brand2: "", hard_brand1: "", hard_brand2: "", main_part: "なし", abbreviation: "なし"}
])
Post.create!([
  {title: "初心者さんにおすすめのスプシ構成", weapon: "スプラシューター", battle: "ナワバリバトル", comment: "汎用性の高い構成です。スプラシューター以外のブキでも使いやすいので使ってみてくださいね。", head_main: 1, head_sub1: 2, head_sub2: 3, head_sub3: 4, body_main: 19, body_sub1: 5, body_sub2: 5, body_sub3: 5, shoes_main: 24, shoes_sub1: 14, shoes_sub2: 13, shoes_sub3: 12, user_id: 6},
  {title: "サブ強化型シャープマーカー編成", weapon: "シャープマーカー", battle: "ガチエリア", comment: "サブインク性能アップをできるだけ積み、遠距離からクイックボム主体で攻める編成です！エリアを取られていても、遠距離から塗れる利点があります。またエリアを取っているときは、前線から遠くの敵をボムで牽制すれば、敵を寄せ付けにくいです！", head_main: 11, head_sub1: 11, head_sub2: 11, head_sub3: 2, body_main: 19, body_sub1: 11, body_sub2: 11, body_sub3: 11, shoes_main: 11, shoes_sub1: 11, shoes_sub2: 11, shoes_sub3: 12, user_id: 13},
  {title: "万能リッターギア", weapon: "リッター4K", battle: "ガチエリア", comment: "頭のサブは0.3分をインク回復にするのもアリです！", head_main: 5, head_sub1: 10, head_sub2: 2, head_sub3: 13, body_main: 22, body_sub1: 1, body_sub2: 1, body_sub3: 1, shoes_main: 25, shoes_sub1: 10, shoes_sub2: 12, shoes_sub3: 13, user_id: 1},
  {title: "スプラ3のエクスプロッシャー用", weapon: "エクスプロッシャー", battle: "ガチホコ", comment: "最大の特徴であるメインをひたすらに撃つ。それがこのブキの運用方法です。", head_main: 1, head_sub1: 12, head_sub2: 12, head_sub3: 13, body_main: 5, body_sub1: 7, body_sub2: 7, body_sub3: 10, shoes_main: 1, shoes_sub1: 3, shoes_sub2: 3, shoes_sub3: 3, user_id: 3},
  {title: "近距離シューター向け万能ギア", weapon: "わかばシューター", battle: "ナワバリバトル", comment: "スペ増を0.2個積んでいますが、安全靴0.1、スパ短0.1に変更しても使いやすいです。", head_main: 5, head_sub1: 14, head_sub2: 6, head_sub3: 7, body_main: 19, body_sub1: 14, body_sub2: 6, body_sub3: 12, shoes_main: 24, shoes_sub1: 14, shoes_sub2: 10, shoes_sub3: 13, user_id: 5},
  {title: "対物デスペナ4K", weapon: "4Kスコープ", battle: "ガチヤグラ", comment: "現環境の4Kに有利なペナアップを採用しています。", head_main: 1, head_sub1: 5, head_sub2: 5, head_sub3: 10, body_main: 22, body_sub1: 6, body_sub2: 6, body_sub3: 10, shoes_main: 25, shoes_sub1: 12, shoes_sub2: 12, shoes_sub3: 13, user_id: 17},
  {title: "イカニン特化", weapon: "スプラシューター", battle: "ガチアサリ", comment: "イカ速0.4はイカニンをちょうど相殺するギア数です。0.1分安全靴に切り替えても差し支えないです。", head_main: 14, head_sub1: 5, head_sub2: 5, head_sub3: 7, body_main: 19, body_sub1: 5, body_sub2: 5, body_sub3: 13, shoes_main: 24, shoes_sub1: 10, shoes_sub2: 10, shoes_sub3: 12, user_id: 19},
  {title: "ガロン好き集まれ", weapon: "96ガロン", battle: "ガチヤグラ", comment: "アクション強化は0.3積んでも0と変わんないので、ブレ軽減のためにつけるなら1か0.4推奨です。", head_main: 14, head_sub1: 5, head_sub2: 5, head_sub3: 5, body_main: 19, body_sub1: 5, body_sub2: 5, body_sub3: 5, shoes_main: 24, shoes_sub1: 13, shoes_sub2: 13, shoes_sub3: 10, user_id: 21},
  {title: "アクロバティックノーチラス", weapon: "ノーチラス47", battle: "ナワバリバトル", comment: "ノーチラスは、扱いが他スピナーと異なりやや難しいが、塗り・キル・補助をすべてこなせる性能があり、自由にロールを切り替えられて非常に楽しい。", head_main: 5, head_sub1: 12, head_sub2: 12, head_sub3: 13, body_main: 14, body_sub1: 4, body_sub2: 4, body_sub3: 7, shoes_main: 4, shoes_sub1: 4, shoes_sub2: 4, shoes_sub3: 4, user_id: 23},
  {title: "マルチミサイル連発型", weapon: "ヴァリアブルローラー", battle: "ナワバリバトル", comment: "マルチミサイルをたくさん打つためのギア", head_main: 17, head_sub1: 6, head_sub2: 6, head_sub3: 6, body_main: 6, body_sub1: 6, body_sub2: 6, body_sub3: 6, shoes_main: 6, shoes_sub1: 6, shoes_sub2: 6, shoes_sub3: 6, user_id: 25},
  {title: "ソイチューバーとかどうですか", weapon: "ソイチューバー", battle: "ガチホコ", comment: "ソイチューバーのみを使ってチャレンジマッチに潜り、S+10まで到達した際に使っていたギア構成です。", head_main: 2, head_sub1: 3, head_sub2: 3, head_sub3: 10, body_main: 6, body_sub1: 12, body_sub2: 12, body_sub3: 10, shoes_main: 5, shoes_sub1: 13, shoes_sub2: 13, shoes_sub3: 7, user_id: 27},
  {title: "復短リトライ型クアッド", weapon: "クアッドホッパーブラック", battle: "ガチアサリ", comment: "敵インクお構い無しの4回スライドの対面力はこのブキの長所です。長所を極限までイカそうと考えた結果、このギア構成になりました。", head_main: 9, head_sub1: 9, head_sub2: 9, head_sub3: 9, body_main: 22, body_sub1: 9, body_sub2: 9, body_sub3: 9, shoes_main: 24, shoes_sub1: 9, shoes_sub2: 9, shoes_sub3: 10, user_id: 29},
  {title: "パブロに必要なのは「サブ性能」", weapon: "パブロ", battle: "ナワバリバトル", comment: "初代スプラからパブロを使い続けた私が思う、スプラ3でのパブロ最適解がこちら。", head_main: 6, head_sub1: 2, head_sub2: 2, head_sub3: 2, body_main: 11, body_sub1: 5, body_sub2: 5, body_sub3: 5, shoes_main: 3, shoes_sub1: 10, shoes_sub2: 12, shoes_sub3: 13, user_id: 1},
  {title: "遠距離好きに", weapon: "14式竹筒銃・甲", battle: "ガチエリア", comment: "今作のスペシャルはモノが多いので対物の刺さる場面は多いです！", head_main: 16, head_sub1: 5, head_sub2: 5, head_sub3: 7, body_main: 22, body_sub1: 1, body_sub2: 3, body_sub3: 2, shoes_main: 25, shoes_sub1: 10, shoes_sub2: 12, shoes_sub3: 13, user_id: 6},
  {title: "クイックジムワイパー", weapon: "ジムワイパー", battle: "ガチホコ", comment: "新武器のジムワイパーギア考察です。", head_main: 11, head_sub1: 3, head_sub2: 3, head_sub3: 10, body_main: 11, body_sub1: 4, body_sub2: 4, body_sub3: 13, shoes_main: 2, shoes_sub1: 4, shoes_sub2: 5, shoes_sub3: 12, user_id: 17},
  {title: "エナドリを回す汎用黒ザップギア", weapon: "N-ZAP85", battle: "ガチホコ", comment: "", head_main: 9, head_sub1: 6, head_sub2: 6, head_sub3: 14, body_main: 8, body_sub1: 4, body_sub2: 4, body_sub3: 4, shoes_main: 24, shoes_sub1: 12, shoes_sub2: 10, shoes_sub3: 7, user_id: 20},
  {title: "新武器LACTを使いたい", weapon: "LACT450", battle: "ナワバリバトル", comment: "", head_main: 18, head_sub1: 5, head_sub2: 5, head_sub3: 5, body_main: 8, body_sub1: 3, body_sub2: 10, body_sub3: 10, shoes_main: 6, shoes_sub1: 6, shoes_sub2: 7, shoes_sub3: 12, user_id: 21},
  {title: "安心安定のカムバデュアル", weapon: "デュアルスイーパー", battle: "ガチヤグラ", comment: "", head_main: 18, head_sub1: 10, head_sub2: 5, head_sub3: 5, body_main: 1, body_sub1: 3, body_sub2: 7, body_sub3: 3, shoes_main: 14, shoes_sub1: 12, shoes_sub2: 12, shoes_sub3: 13, user_id: 23},
  {title: "移動盛りハイド", weapon: "ハイドラント", battle: "ガチアサリ", comment: "前線でガシガシ戦う編成です。", head_main: 18, head_sub1: 5, head_sub2: 4, head_sub3: 5, body_main: 5, body_sub1: 4, body_sub2: 5, body_sub3: 5, shoes_main: 24, shoes_sub1: 7, shoes_sub2: 10, shoes_sub3: 10, user_id: 23},
  {title: "スクスロにおすすめ", weapon: "スクリュースロッシャー", battle: "ガチアサリ", comment: "デスに依存しない安定型のスクスロ編成です。", head_main: 2, head_sub1: 4, head_sub2: 4, head_sub3: 7, body_main: 3, body_sub1: 5, body_sub2: 5, body_sub3: 13, shoes_main: 24, shoes_sub1: 10, shoes_sub2: 10, shoes_sub3: 12, user_id: 13}
])
ActiveStorage::Attachment.create!([
  {name: "image", record_type: "User", record_id: 3, blob_id: 7},
  {name: "image", record_type: "User", record_id: 4, blob_id: 8},
  {name: "image", record_type: "User", record_id: 5, blob_id: 9},
  {name: "image", record_type: "User", record_id: 6, blob_id: 10},
  {name: "image", record_type: "User", record_id: 2, blob_id: 12},
  {name: "image", record_type: "User", record_id: 13, blob_id: 13},
  {name: "image", record_type: "User", record_id: 17, blob_id: 14},
  {name: "image", record_type: "User", record_id: 18, blob_id: 15},
  {name: "image", record_type: "User", record_id: 19, blob_id: 16},
  {name: "image", record_type: "User", record_id: 20, blob_id: 17},
  {name: "image", record_type: "User", record_id: 21, blob_id: 18},
  {name: "image", record_type: "User", record_id: 22, blob_id: 19},
  {name: "image", record_type: "User", record_id: 23, blob_id: 20},
  {name: "image", record_type: "User", record_id: 24, blob_id: 21},
  {name: "image", record_type: "User", record_id: 25, blob_id: 22},
  {name: "image", record_type: "User", record_id: 26, blob_id: 23},
  {name: "image", record_type: "User", record_id: 29, blob_id: 24}
])
ActiveStorage::Blob.create!([
  {key: "ord13g7ondgxiz644vemr9uw6qt0", filename: "pet_nekotsugura.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 175116, checksum: "J/FWz6G+eQJ5KHowDs+Y5A=="},
  {key: "6qw60qhcfvyyh0cn310d7ri1li1v", filename: "cat1_smile.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 60544, checksum: "ucBXofcnSzATk8PuZOGRkg=="},
  {key: "qfyosyejb9tjltavlt013ekubysn", filename: "monogatari_alice_cheshire_neko.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 125572, checksum: "QuigZjNwWmSnR8GAZYXH1w=="},
  {key: "plqmugz40vycxijrwlfcwd5pbw15", filename: "cat_boss_gang.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 112656, checksum: "G4hkqpqDkEnPp8HU4sw0oA=="},
  {key: "08htw02hsavre0mfn30466gfcrbl", filename: "download.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 1759, checksum: "MwRrGPU7Rk0hxpwzwDV1Vg=="},
  {key: "j513r24kxss8r1nfaylgyzqxglw8", filename: "nagagutsu_haita_neko.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 15032, checksum: "byXKZu1PypnXEkhlbULnCg=="},
  {key: "lrby6sxz8okahdealvvoc3heldho", filename: "animal_smile_neko.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 14749, checksum: "CxVmrs4nOcl2nANISWaYBg=="},
  {key: "x3haqqtch5s6wokp1lqfvooj7dhs", filename: "sleep_animal_cat.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 15963, checksum: "6C2ehpKtxOBIxh7h9rdG9Q=="},
  {key: "0m27hoxpxiiavbn0hzqtoj5t1z7g", filename: "nakayoshi_cats_couple.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 16881, checksum: "u4CqV2e3o3RO+wiMtwzgpg=="},
  {key: "gc6rrvpbtg3itbjp03emlya0gbl8", filename: "neko_punch.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 16610, checksum: "Y3dCMRE6TzvBsCIQDq4hVQ=="},
  {key: "t98nmn4fx0a7xl4emtv7jdmfd42x", filename: "neko_nobi.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 23177, checksum: "MGHcssJsgUVFgL4LnWLfhw=="},
  {key: "mfeozl040fhcyqh9werpo6tqyw2r", filename: "cat_bengal.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 16396, checksum: "LM1AHA2HPS0mBlK/q5kSHg=="},
  {key: "8zdf6raq5xx0qkftdly5yq2c8x6l", filename: "pet_fat_cat.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 17508, checksum: "UHgcfYzHFftAJ6DHR+RcqQ=="},
  {key: "yat381pysn60cifp57wtktypo7bd", filename: "christmas_neko.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 11097, checksum: "AuPw5EO5PA4pYnPQW23BmA=="},
  {key: "94apy6yv3p2pcfa4j5i1antyx97w", filename: "animal_chara_neko_police.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 13238, checksum: "8hSLFPp2WlfoPHLNoIY2hg=="},
  {key: "exgcepxlt93qzdi1niotq2suh4hm", filename: "uchidenokoduchi_eto13_neko.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 11054, checksum: "4T2PtSFi5Y37lLuWQAwLUw=="},
  {key: "vfsouzhhl8bqht1t3ilosd2dq5mb", filename: "neko_oyako.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 23143, checksum: "bSOUv9fhKqR3Lw0ZnNHTOw=="}
])
