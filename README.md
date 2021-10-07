# README

# 概要
売り手と買い手を仲介する、フリーマーケットアプリケーション  
コメント機能は、今後追加予定 
  
# 開発環境
  Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
    
    
# データベース設計
## usersテーブル
-----
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| email              | string   | null: false |
| password           | string   | null: false |
| nickname           | string   | null: false |
| name_kanji         | string   | null: false |
| name_kana          | string   | null: false |
| birth_day          | date     | null: false | 

### Association
- has_many :items
- has_many :orders


## itemsテーブル
-----
| Column            | Type           | Options                         |
| ----------------- | -------------- | ------------------------------- |
| user_id           | references     | null: false, foreign_key: true  |
| title             | string         | null: false                     |
| detail            | text           | null: false                     |
| category_id       | references     | null: false                     |
| quality_id        | references     | null: false                     |
| shipping_fee_id   | references     | null: false                     |
| prefecture_id     | references     | null: false                     |
| shipment_days_id  | references     | null: false                     |
| price             | integer        | null: false                     |
| image             | ActiveStorage  | null: false, foreign_key: true  | 
​
### Association
- belongs_to :user
- has_one :order

​ 

## ordersテーブル
-----
| Column             | Type       | Options     |
| ------------------ | ---------  | ----------- |
| user_id            | references | null: false, foreign_key: true |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| city_town          | string     | null: false |
| address_number     | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |

### Association
- belongs_to :user
- belongs_to :item
​