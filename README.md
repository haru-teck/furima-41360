``# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
|--------------------|--------|------------------------------|
| nickname           | string | null: false                  |
| email              | string | null: false, unique: true    |
| encrypted_password | string | null: false, default: ""     |  
| lastname           | string | null: false                  |
| firstname          | string | null: false                  |
| lastname_yomi      | string | null: false                  |
| firstname_yomi     | string | null: false                  |
| birthday           | date   | null: false                  |

### Association

- has_many :items
- has_many :histories



## items（商品情報） テーブル

| Column             | Type     | Options    |
|--------------------|--------- |------------|
| title              | string   | null: false|
| explanation        | text     | null: false|
| category_id        | integer  | null: false|
| status_id          | integer  | null: false|
| shipping_fee_id    | integer  | null: false|
| prefecture_id      | integer  | null: false|
| ship_day_id        | integer  | null: false|
| information        | text     | null: false|
| price              | integer  | null: false|
| user               | references  | null: false, foreign_key:true| 

### Association

- belongs_to :user
- has_one :history
- has_one_attached :image

## histories（購入履歴） テーブル

| Column          | Type    | Options                      |
|-----------------|---------|------------------------------|
| user            | references  | null: false, foreign_key:true| 
| item         | references  | null: false, foreign_key:true| 

### Association

-belongs_to :user
-belongs_to :item
-has_one :delivery

## deliveries（配送先情報） テーブル

| Column             | Type    | Options                      |
|--------------------|---------|------------------------------|
| post               | string  | null: false                  |
| prefecture_id      | integer | null: false                  |
| municipality       | string  | null: false                  |
| street_address     | string  | null: false                  |
| building_name      | string  |                              |
| telephone          | string  | null: false                  |
| history            | references  | null: false, foreign_key:true| 

### Association

- belongs_to :history

``