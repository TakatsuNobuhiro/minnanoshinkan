# みんなの新歓
[![CircleCI](https://circleci.com/gh/TakatsuNobuhiro/minnanoshinkan.svg?style=svg)](https://circleci.com/gh/TakatsuNobuhiro/minnanoshinkan)
---

学生とサークルの双方向のやりとりによりオンラインで新歓活動を行えるアプリ.

## URL

---

URL:[みんなの新歓](https://minnanoshinkan.herokuapp.com/)
トップページかの「ゲストログインボタン」からゲストユーザーとしてログインしアプリをご使用いただけます。

## 作成目的

---

2020 年度の新歓活動は新型コロナウイルスによりオンラインでの新歓が余儀なくされました。
サークル側は新入生にサークルの存在を認知させる手段がなく、新入生はどんなサークルが存在するのか分からないまま月日が立ち、サークルの加入率は激減しました。
実際に私自身、フットサル部の幹部として今年度の新歓の難しさを身近に痛感し、頭を悩ませていました。
そんな深刻な社会問題を解決するためにサークルと新入生が双方向でやりとりができるプラットフォームを作ろうと決心しました。

## マーケティング

---

学内（東工大）の部活の幹部とは連絡が取り合えるため、各サークルにサークルの登録と新歓期に SNS を通じて新歓アプリの紹介をお願いする。
新入生の健康診断の日にアプリの紹介ビラを配り、学内での定着を図る。
学内で定着したら、他大学への進出を図る

## 機能一覧

---

### ユーザー機能（サークルと生徒別々で実装）

- ログイン認証 (Devise)
- ユーザー登録後にプロフィール編集ページ遷移
- -プロフィール画像の登録・編集(ActiveStorage)

### 投稿機能(サークルのみ)

- 投稿（タイトル,時間,場所,内容）・編集・削除(Action Text)
- 時間投稿機能
- 地図表示（Google Maps API）
- 投稿タグ付機能
- ページネーション機能(kaminari,Ajax)
- SNS 共有機能(Twitter)
- PV数計測

### 決済機能(Stripe)

- 課金後、メール送信権利を付与
- メール送信後、メール送信権利剥奪

### メール送信機能(Action Mailer)

- お問い合わせフォーム
- 課金制イベント通知メール(サークル → 学生)

### フォロー機能(Ajax)

- ユーザーフォロー機能(学生 ⇆ 学生)

### お気に入り機能(Ajax)

- お気に入り機能（学生 → イベント）
- お気に入り機能（学生 → サークル）

### カレンダー表示機能

- イベントをカレンダーに表示(Ajax)

### コメント機能

- イベントへのコメント投稿
- イベント主催サークル、その他学生への通知

### 検索機能(Ajax)

- イベント検索(イベント名+イベント時間 or タグ　検索)
- 生徒検索(生徒名で検索)
- サークル検索(サークル名で検索)

### 通知機能

- フォロー通知 (生徒 ⇆ 生徒)
- お気に入り通知（生徒 → サークル、イベント）
- 投稿通知(サークル → 生徒（サークルをお気に入り登録している生徒のみ）)
- コメント通知(投稿者 → 同じイベントにコメントしているユーザー＋イベントをお気に入りに登録しているユーザー＋イベント投稿者)
- 通知表示(新着通知がある時は点灯)
- 通知削除機能

## 使用技術

---

### フロント

- HTML5
- Scss
- Javsscript
- Bootstrap(一部使用)

### バックエンド

- Ruby 2.7.2
- rails 6.0.3.4

### インフラ・本番環境

- Heroku
- MySQL 8.0

### テスト・開発環境等

- Docker/docker-compose
- Cicle CI
- Rspec
- Rubocop
- VSCode
- Git Github

## ER 図

---

![erd](https://user-images.githubusercontent.com/65536732/99871369-2caad900-2c1d-11eb-8c68-04c3a25fc39f.png)
