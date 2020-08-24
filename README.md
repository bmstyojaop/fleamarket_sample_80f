
# fleamarket_sample_80f README

## ビジネス書に特化したフリマアプリ。探しているものが、ピンポイントで見つかる。

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
|seller_id|string|references, null: false, foreign_key: true|
|buyer_id|string|references, foreign_key: true|
|deal_closed_date|string|timestamp|


### Association

- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
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

