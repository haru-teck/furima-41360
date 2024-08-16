# テーブル設計

## users テーブル

| Column          | Type   | Options                      |
|-----------------|--------|------------------------------|
| nickname        | string | null: false                  |
| email           | string | null: false, unique: true   |
| password        | string | null: false                  |
| lastname        | string | null: false                  |
| firstname       | string | null: false                  |
| lastname_yomi   | string | null: false                  |
| firstname_yomi  | string | null: false                  |
| 
### Association

- has_many :products
- has_many :historys
-belong_to :deliverys


## products（商品情報） テーブル

| Column           | Type    | Options    |
|------------------|---------|------------|
| title            | string  | null: false|
| category         | string  | null: false|
| status           | string  | null: false|
| shipping_fee     | integer | null: false|
| shipping_source  | string  | null: false|
| days             | integer | null: false|
| price            | integer | null: false| 
| commission       | integer | null: false|
| profit           | integer | null: false|  


### Association

- has_many :users
- has_many :history
- belongs_to :deliverys

## historys（購入履歴） テーブル

| Column          | Type    | Options                      |
|-----------------|---------|------------------------------|
| id              | integer |                   |
| user_id         | integer | null: false, foreign_key   |
| product_id      | integer | null: false, foreign_key
| amount          | integer | null: false                  |

### Association

- belongs_to :users
- belongs_to :products
- belongs_to :deliverys

## deliverys（配送先情報）） テーブル

| Column          | Type    | Options                      |
|-----------------|---------|------------------------------|
| post            | integer | null: false                  |
| prefectures     | string  | null: false                  |
| municipalities  | string  | null: false                  |
| street_address  | integer | null: false                  |
| building_name   | string  |                              |
| telephone       | integer | null: false                  |

### Association

- belongs_to :users
- belongs_to :products
- belongs_to :historys
