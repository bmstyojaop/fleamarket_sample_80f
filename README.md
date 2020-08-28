
# 80期生Team F 最終課題

５人チームでフリマアプリのクローンサイトを作成いたしました  
制作期間: 2020年8月4日-8月28日  
本番環境: http://18.180.238.181/  
  
Basic認証  
  * NAME: shibuya80f
  * PASS: shibuya80fbusiness  

確認用購入者用アカウント  
  * EMAIL: furima@taro
  * PASS: furima0123

  * クレジットカード情報
    * カード番号: 4242424242424242
    * 期限: 12/20
    * セキュリティコード: 123

確認用出品者用アカウント  
  * EMAIL: furima@hanako
  * PASS: furima4567

## メンバー紹介

### 佐久間
  * スクラムマスター
  * DB設計
  * 商品出品機能
  * 商品詳細表示機能
  * 商品詳細ページのマークアップ
  * 商品削除機能
  * 商品情報編集機能
  * 商品についてのついての質問・コメント機能
  * お気に入り機能
  * 商品検索Lv.2

### 高橋
  * DB設計
  * 本番環境に自動デプロイ
  * ユーザー新規登録、ログイン
  * ユーザー新規登録マークアップ
  * 商品一覧表示
  * カテゴリ機能
  * ユーザーマイページのマークアップ
  * トップページのマークアップ
  * ユーザー新規登録、ログイン（SNSのAPI）

### 岩辺
  * DB設計
  * 商品購入機能
  * 商品購入機能マークアップ
  * 商品購入確認ページのマークアップ
  * パンくず機能

### 猪瀬
  * 商品一覧表示
  * 商品検索Lv1

### 松本
  * DB設計

## アプリ説明

### サインアップ/ログイン  
![Animated GIF-downsized](https://user-images.githubusercontent.com/67876040/91416508-6ec8b680-e88a-11ea-8e60-240a65024e2b.gif)  
新規登録はウィザード形式で、ユーザー情報、住所（お届け先）の順に登録いたします。  
ログインはemailとpasswordの２つの情報が必要になります。  

### 商品の出品  
![Animated GIF-downsized (1)](https://user-images.githubusercontent.com/67876040/91433267-02f04900-e89e-11ea-83a2-c9bfa8d4d680.gif)  
商品の出品はトップページ右下の「出品する」をクリックすることで商品を出品することができます  
出品情報は必須を全て入力しなければ進めないようになっています。  
商品出品後は、トップページに表示されております。  

### クレジットカードの登録・削除  
![Animated GIF-downsized (4)](https://user-images.githubusercontent.com/67876040/91529417-3a193580-e944-11ea-91c9-700b8e5b6936.gif)  
クレジットカードの登録は上記の値を入力していただくと登録できます。  
カード情報がある時はカードの詳細情報を閲覧できます。  


### 商品の購入  
![Animated GIF-downsized (2)](https://user-images.githubusercontent.com/67876040/91433583-75612900-e89e-11ea-8a30-72c135d5a02c.gif)  
出品者以外は、購入するボタンが表示されます。クレジットカードが登録されていれば、購入を実行することができます。  
カードが登録されていない場合、カード登録画面へと遷移いたします。  
カードの登録はマイページのサイドバーで実行することができますが、デフォルトで登録されているカードをお使いください。  
商品購入後は売り切れと表示され、トップページで商品を購入することができなくなります。  

### ログアウト実行のお願い  
![Animated GIF-downsized (3)](https://user-images.githubusercontent.com/67876040/91433799-c7a24a00-e89e-11ea-90ff-df5a06d32d1f.gif)  
最後に、必ずログアウトいただきますようお願い申し上げます。ログアウトはヘッダーもしくはマイページのサイドバーにございます。

## ER図
![スクリーンショット 2020-08-27 16 47 25](https://user-images.githubusercontent.com/67876040/91431484-6462e880-e89b-11ea-96d8-ee21b10585fd.png)



## usersテーブル

| Column | Type | Options|
|--------|------|--------|
|nickname|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|

### Association


- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :credit_cards, dependent: :destroy
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"

- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy



## itemsテーブル

| Column | Type | Options|
|--------|------|--------|
|item_name|string|null: false|
|author|string|null: false|
|company|string|null: false|
|price|string|null: false|
|item_introduction|text|null:false|
|postage_payer_id|string|references, null: false, foreign_key: true|
|category_id|string|references, null: false, foreign_key: true|
|item_condition_id|string|references, null: false, foreign_key: true|
|preparation_day_id|string|references, null: false, foreign_key: true|
|postage_type_id|string|references, null: false, foreign_key: true|
|deal_closed_date|string|timestamp|


### Association

- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :seller, class_name: "User"
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :item_condition
- Gem: jp_prefectureを使用して都道府県コードを取得

## categoriesテーブル

| Column | Type | Options|
|--------|------|--------|
|name|string|null: false| 
|ancestry|string|null: false, index: true|


### Association

- has_many :items
- has_ancestry



## postage_typesテーブル

| Column | Type | Options|
|--------|------|--------|
|postage_type|string|null: false| 


### Association

- has_many :items



## preparation_daysテーブル

| Column | Type | Options|
|--------|------|--------|
|preparation_day|string|null: false| 

### Association

- has_many :items



## postage_payersテーブル

| Column | Type | Options|
|--------|------|--------|
|postage_payer|string|null: false| 

### Association

- has_many :items



## item_conditionsテーブル

| Column | Type | Options|
|--------|------|--------|
|item_condition|string|null: false| 

### Association

- has_many :items





## item_imagesテーブル

| Column | Type | Options|
|--------|------|--------|
|item_id|string|references, foreign_key: true|
|url|string|null: false| 

### Association

- belongs_to :item



## commentsテーブル(中間テーブル)

| Column | Type | Options|
|--------|------|--------|
|user_id|string|references, null: false, foreign_key: true|
|item_id|string|references, null: false, foreign_key: true|
|comment|text|null: false|
|created_at|timestamp|null: false|

### Association

- belongs_to :user
- belongs_to :item




## favoritesテーブル

| Column | Type | Options|
|--------|------|--------|
|user_id|string|references, null: false, foreign_key: true|
|item_id|string|references, null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item



## profilesテーブル

| Column | Type | Options|
|--------|------|--------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|introduction|text||
|image|string||  
|user_id|string|references, null: false, foreign_key: true|


### Association
- belongs_to :user



## credit_cards(pay.jp)テーブル

| Column | Type | Options|
|--------|------|--------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|


### Association

- belongs_to :user




## sending_destinationsテーブル

| Column | Type | Options|
|--------|------|--------|
|phone_number|string||
|post_code|string(7)|null: false|
|prefecture_code|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_number|string||
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|user_id|string|references, null: false, foreign_key: true|


### Association

- belongs_to :user




