# README

# 概要
売り手と買い手を仲介する、フリーマーケットアプリケーション

# 開発環境
 Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# データベース設計
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
| Column            | Type           | Options                         |
| ----------------- | -------------- | ------------------------------- |
| user_id           | references     | null: false, foreign_key: true  |
| title             | integer        | null: false                     |
| detail            | string         | null: false                     |
| category          | integer        | null: false                     |
| quality_id        | references     | null: false                     |
| prefecture_id     | references     | null: false                     |
| shipment_time_id  | references     | null: false                     |
| price             | integer        | null: false                     |
| image             | ActiveStorage | null: false, foreign_key: true   | 
​
### Association
​
- belongs_to :user
- has_many :comments, dependent: :destroy
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
- 
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