# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false, foreign_key: true |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| firstname          | string | null: false |
| lastname_yomi      | string | null: false |
| firstname_yomi     | string | null: false |
| firstname          | string | null: false |
| birthday           | integer | null: false |
| intoroduce         | text | null: false |





## product（商品） テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| title              | string    | null: false, foreign_key: true |
| price              | integer | null: false | 
| explanation        | text | null: false |
| status             | string | null: false |
| size               | string | null: false |
| cotegory           | string | null: false |
| shipping_fee       | integer | null: false |
| shipping_source    | string | null: false |
| days               | integer | null: false |


## buyer（購入者）） テーブル

 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false, foreign_key: true |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| firstname          | string | null: false |
| lastname_yomi      | string | null: false |
| firstname_yomi     | string | null: false |
| firstname          | string | null: false |
| birthday           | integer | null: false |
| intoroduce         | text | null: false |
| post               | integer | null: false |
| prefectures        | string | null: false |
| municipalities     | string | null: false |
| intoroduce         | string | null: false |
| street_address     | string | null: false |
| building_name      | string | |
| telephone          | integer | null: false |








## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |