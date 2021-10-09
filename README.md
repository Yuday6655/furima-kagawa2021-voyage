# README

# 概要
売り手と買い手を仲介する、フリーマーケットアプリケーション
 
## 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
    
    
# データベース設計
## usersテーブル
-----
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
| first_name_kanji   | string   | null: false |
| last_name_kanji    | string   | null: false |
| first_name_kana    | string   | null: false |
| last_name_kana     | string   | null: false |
| birth_day          | date     | null: false | 

### Association
- has_many :items
- has_many :orders
- has_one :address, dependent: :destroy



## itemsテーブル
-----
| Column            | Type           | Options                         |
| ----------------- | -------------- | ------------------------------- |
| user              | references     | null: false, foreign_key: true  |
| title             | string         | null: false                     |
| detail            | text           | null: false                     |
| price             | integer        | null: false                     |
| category_id       | integer        | null: false                  |
| quality_id        | integer        | null: false                  |
| shipping_fee_id   | integer        | null: false                   |
| shipment_days_id  | integer        | null: false                  |



### Association
- belongs_to :user
- has_one :order

## addressesテーブル
-----
| Column            | Type           | Options                         |
| ----------------- | -------------- | ------------------------------- |
| user             	|references	null: false, foreign_key: true
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false                   |
| city_town          | string     | null: false |
| address_number     | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |


### Association
- belongs_to :user


## ordersテーブル （後日実装予定）
-----
| Column             | Type       | Options     |
| ------------------ | ---------  | ----------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one : address

​