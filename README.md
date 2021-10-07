# README

# テーブル設計
​
## usersテーブル
​
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| email              | string   | null: false |
| password           | string   | null: false |
| nickname           | string   | null: false |
| lastname_kanji     | string   | null: false |
| firstname_kanji    | string   | null: false |
| lastname_kana      | string   | null: false |
| firstname_kana     | string   | null: false |
| birth_year         | string   | null: false |
| birth_month        | string   | null: false |
| birth_day          | string   | null: false |
​
### Association
​
- has_many :items
- has_many :comments
- has_many :orders
​
## itemsテーブル
​
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| price              | integer    | null: false                     |
<!-- | shipping_fee       | integer    | null: false                     | -->
<!-- | shipment_area      | text       | null: false                     | -->
<!-- | shipment_date      | text       | null: false                     | -->
| user               | references | null: false, foreign_key: true  |
​
### Association
​
- belongs_to :user
- has_many :comments
- has_one :order
​
## commentsテーブル
​
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
​
### Association
​
- belongs_to :user
- belongs_to :item
​
## ordersテーブル
​
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| postal_code        | string   | null: false |
| prefecture         | string   | null: false |
| city_town          | string   | null: false |
| add_number         | string   | null: false |
| building           | string   | null: false |
| telephone_number   | string   | null: false |
| user               | references | null: false, foreign_key: true |
​
### Association
​
- belongs_to :user
- belongs_to :item
​