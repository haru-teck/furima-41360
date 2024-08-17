# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
|---------------   --|--------|------------------------------|
| nickname           | string | null: false                  |
| email              | string | null: false, unique: true    |
| encrypted_password | string | null: false, default: ""     |  
| lastname           | string | null: false                  |
| firstname          | string | null: false                  |
| lastname_yomi      | string | null: false                  |
| firstname_yomi     | string | null: false                  |
| birthday           | date   | null: false                  |

### Association

- has_many :products
- has_many :histories



## products（商品情報） テーブル

| Column             | Type     | Options    |
|-----------------  -|--------- |------------|
| title              | string   | null: false|
| category_id        | integer  | null: false|
| status_id          | integer  | null: false|
| shipping_fee_id    | integer  | null: false|
| shipping_source_id | integer  | null: false|
| information        | text     | null: false|
| price              | integer  | null: false|
| user_id            | integer  | null: false, foreign_key:true| 

### Association

- belongs_to :user
- has_one :history
- has_one_attached :image

## historys（購入履歴） テーブル

| Column          | Type    | Options                      |
|-----------------|---------|------------------------------|
| user_id         | integer | null: false, foreign_key: true   |
| product_id      | integer | null: false, foreign_key: true   |

### Association

-belongs_to :user
-belongs_to :product
-has_one :delivery

## deliveries（配送先情報） テーブル

| Column             | Type    | Options                      |
|-----------------   |---------|------------------------------|
| post               | string  | null: false                  |
| prefectures_id     | integer | null: false                  |
| municipality       | string  | null: false                  |
| street_address     | string  | null: false                  |
| building_name      | string  |                              |
| telephone          | string  | null: false                  |
| history_id         | integer | null: false, foreign_key: true     |

### Association

- belongs_to :history

