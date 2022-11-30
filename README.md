![](https://img.shields.io/badge/release-v1.0.0-blue)
![](https://img.shields.io/badge/Ruby-v3.0.2-red)
![](https://img.shields.io/badge/Rails-v6.1.7-critical)

# スプラトゥーン3 ギア編成投稿所
![カバー](https://user-images.githubusercontent.com/107730981/203672946-be52b6ce-242c-4501-8406-432209efe30c.png)

## アプリケーション概要
### スプラトゥーン3を遊んでいるユーザーに向けたサービス
スプラトゥーン3ギア編成投稿所は、ギア編成の共有が可能なサービスです。<br>
ギア編成を共通したい・人気のギア編成を知りたいユーザーをサポートします。

#### スプラトゥーン3とは？
インクを発射するブキを使い、ステージを塗ったりプレイヤーを攻撃したりすることを楽しむシューティングゲームです。<br>
任天堂より、Nintendo Switch用に発売されています。

### サービスを作った思い
スプラトゥーン3では、ギアパワーと呼ばれる特殊能力の組み合わせによって、バトルをより有利に進められます。<br>
このギアパワーは27種もあり、使用するブキ・行うバトルの種類によって相性の良し悪しがあります。<br>
そのため、スプラトゥーン3を遊ぶうえで、「どのギアパワーを使えばいいんだろうか？」という疑問を避けて通ることはできません。<br>
<br>
そこで、「使うべきギアパワーを知れる場所を作りたい」という思いから、攻略サイトで働いていた経験をもとに、スプラトゥーンを遊んでいる人がより楽しめるように開発しました。

## URL
http://spla3-gear-posting.ml/

#### ゲストログインの方法
![ゲストログインボタン](https://user-images.githubusercontent.com/107730981/203513485-ed932495-c48c-4ed1-9ff4-a5cc99394a1d.png)
ヘッダー内の「ゲストログイン」をクリックすると、メールアドレスとパスワードなしでログインいただけます。<br>
※ゲストアカウントは、ユーザープロフィールの編集を制限しています。<br>

## 機能紹介
### 機能一覧
- ユーザー登録、ログイン機能
- 投稿機能
- お気に入り機能（ajax）
- パンくず機能
- 投稿検索、ユーザー検索機能

### ページごとの役割
|画面|ページ内容|
| --- | --- |
|![トップページ](https://user-images.githubusercontent.com/107730981/203727213-4220e541-c2a6-4ce1-8c37-9ce662724de3.png)|**【トップページ】**<br>ファーストビューに新規登録/ログイン/投稿検索を置き、これらのアクションを行うユーザーが多くなるようにしています。ただ、これらのアクションを行わないユーザーもいるため、下にスクロールすることで投稿やユーザーを見れるようにもしています。|
|![ユーザー登録ページ](https://user-images.githubusercontent.com/107730981/203741039-e8e68de3-d7f0-40f5-b22e-99cbde740774.png)|**【ユーザー登録ページ】**<br>ユーザー名・メールアドレス・パスワード・確認用パスワードを入力し、新規登録します。ユーザーが意図せずブラウザを閉じてしまう、または遷移してしまうことへの対策として、離脱時に確認ダイアログが表示されます。|
|![ログインページ](https://user-images.githubusercontent.com/107730981/203741045-94968c70-15f7-4b1d-b630-a501f8913ef7.png)|**【ログインページ】**<br>メールアドレス・パスワードを入力しログインします。|
|![ユーザー一覧ページ](https://user-images.githubusercontent.com/107730981/203741052-2352ea96-c3d5-4532-84f0-3fe399f0028a.png)|**【ユーザー一覧ページ】**<br>登録済みの全ユーザーを表示します。テキストによるユーザー名の検索と、チェックボックスによるウデマエの検索に対応しています。|
|![ユーザー検索結果ページ](https://user-images.githubusercontent.com/107730981/203741066-4f5f94cf-0c44-4c80-8d01-7deb19cd5b1b.png)|**【ユーザー検索結果ページ】**<br>ユーザーの検索結果を表示します。|
|![ユーザー詳細ページ](https://user-images.githubusercontent.com/107730981/203741094-537c92af-8b32-4b15-9b14-804b523578b4.png)|**【ユーザー詳細ページ】**<br>ユーザーごとのプロフィールを表示します。投稿とお気に入りは、トグル機能によって表示を切り替えます。またログイン者が自身のユーザー詳細ページを開いた場合のみ、「プロフィールを編集」ボタンを表示します。|
|![ユーザーアカウントページ](https://user-images.githubusercontent.com/107730981/203741109-f9d12979-f867-49d9-9c4f-4e409017eb71.png)|**【ユーザーアカウントページ】**<br>登録しているユーザー情報を表示します。|
|![ユーザー編集ページ](https://user-images.githubusercontent.com/107730981/203741119-f9f96073-3897-42ee-b928-4741f19b3103.png)|**【ユーザー編集ページ】**<br>登録しているユーザー情報の変更を行います。パスワードの欄は、変更する場合のみ入力します。|
|![ギア編成投稿ページ](https://user-images.githubusercontent.com/107730981/203741129-1b91044a-8704-427a-994b-fa5ddb1725fe.png)|**【ギア編成投稿ページ】**<br>投稿するギア編成の内容を入力します。ギアパワーの選択は、ラジオボタンによって制御しています。|
|![ギア編成一覧ページ](https://user-images.githubusercontent.com/107730981/203741143-d4676f95-7975-4e62-8861-83a07051b975.png)|**【ギア編成一覧ページ】**<br>全投稿を表示します。テキスト検索をはじめ、投稿者のウデマエ、おすすめブキ、おすすめバトル検索にも対応しています。また並び替えも可能です。|
|![ギア編成検索結果ページ](https://user-images.githubusercontent.com/107730981/203741153-aaa14227-51b4-409b-a9fa-ed621f808269.png)|**【ギア編成検索結果ページ】**<br>ギア編成の検索結果を表示します。|
|![ギア編成詳細ページ](https://user-images.githubusercontent.com/107730981/203741164-34e7eff5-fd3e-454b-b334-2e07a84f3acd.png)|**【ギア編成詳細ページ】**<br>ギア編成ごとの詳細を表示します。ログイン者が投稿者である場合のみ、「編集する」ボタンと「削除する」ボタンを表示します。|
|![ギア編成編集ページ](https://user-images.githubusercontent.com/107730981/203741175-5b20958a-c490-476a-9230-b5f71ebf0564.png)|**【ギア編成編集ページ】**<br>登録しているギア編成情報の変更を行います。|
|![ギアパワー一覧ページ](https://user-images.githubusercontent.com/107730981/203741184-b54ca0e1-2c1f-4968-bd8c-ff39a08fdc23.png)|**【ギアパワー一覧ページ】**<br>全ギアパワーを表示します。DB化した情報を表示しているため、ゲームのアップデートによってギアパワーの追加や調整が行われても、DBを調整するだけでページを更新できます。|
|![ギアパワー詳細ページ](https://user-images.githubusercontent.com/107730981/203741195-d89e470c-8698-466c-ae4d-ec49cbe9ecc2.png)|**【ギアパワー詳細ページ】**<br>ギアパワーごとの情報を表示します。ギアパワー一覧と同様に、DB化した情報を表示しています。|

### 追加予定の機能
- ユーザー同士のフォロー機能
- ギア編成投稿に対するコメント機能
- ギア編成投稿のタグ付け機能
- Twitter認証によるログイン機能
- ユーザー登録時のメールアドレス認証機能
- パスワード再発行機能
- お問い合わせ機能

## スプラトゥーン3ギア編成投稿所について
### 登場人物
- スプラトゥーン3を遊んでいる方

### ユーザーが抱える課題
- 自分が考えたギア編成を、紹介する場所がない
- ギアパワーに種類がありすぎて、ベストなギア編成がわからない
- ギアパワーに種類がありすぎて、ギアパワーの効果を覚えられない
- 自分が好きなブキやバトルにマッチするギア編成を、サクッと知りたい
- 気になるギア編成を見つけたら、お気に入りしておきたい

### 解決方法
- ギア編成を投稿する場所を用意することで、紹介したいユーザー←→参考にしたいユーザーによる需要と供給を合致させる。

### マーケット
- スプラトゥーン3にて、自分が考えたギア編成を紹介したい方
- スプラトゥーン3にて、人気のギア編成を知りたい方
- スプラトゥーン3を通してコミュニケーションを取りたい方

## 使用技術
- Ruby 3.0.2
- Rails 6.1.7
- RSpec 6.0.0
- SQLite
- javascript
- jQuery
- ajax
- AWS
  - EC2
  - S3

### 機能における主要なGem
- active storage（画像アップロード）
- devise（ユーザー認証）
- gretel（パンくずリスト）
- ransack（検索）
- factory bot（テストデータ作成）
- faker（ダミーデータ作成）

## データベース設計
<img src="https://user-images.githubusercontent.com/107730981/203687438-2caae413-0cee-484f-bbba-7fe27565ae0f.png" alt="ER図" width="95%">
