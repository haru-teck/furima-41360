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
| birthday        | date   | null: false                  |
| introduce       | text   | null: false                  |

### Association

- has_many :products
-belong_to :buyers


## products（商品） テーブル

| Column           | Type    | Options    |
|------------------|---------|------------|
| title            | string  | null: false|
| price            | integer | null: false| 
| explanation      | text    | null: false|
| status           | string  | null: false|
| size             | string  | null: false|
| category         | string  | null: false|
| shipping_fee     | integer | null: false|
| shipping_source  | string  | null: false|
| days             | integer | null: false|

### Association

- belongs_to :user
- belongs_to :buyer

## buyers（購入者）） テーブル

| Column          | Type    | Options                      |
|-----------------|---------|------------------------------|
| nickname        | string  | null: false                  |
| email           | string  | null: false, unique: true   |
| password        | string  | null: false                  |
| lastname        | string  | null: false                  |
| firstname       | string  | null: false                  |
| lastname_yomi   | string  | null: false                  |
| firstname_yomi  | string  | null: false                  |
| birthday        | date    | null: false                  |
| introduce       | text    | null: false                  |
| post            | integer | null: false                  |
| prefectures     | string  | null: false                  |
| municipalities  | string  | null: false                  |
| street_address  | string  | null: false                  |
| building_name   | string  |                              |
| telephone       | string  | null: false                  |

### Association

- belongs_to :user
- belongs_to :product



