# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### アソシエーション

has_many :items
has_one  :buyer


## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| image                      | text       | null: false
| product_name               | string     | null: false                    |
| product_description        | text       | null: false                    |
| category                   | string     | null: false                    |
| product_condition          | string     | null: false                    |
| burden_of_shipping_charges | string     | null: false                    |
| shipping_area              | string     | null: false                    |
| days_to_ship               | string     | null: false                    |
| price                      | string     | null: false                    |
| user_id                    | references | null: false, foreign_key: true |
### アソシエーション

belongs_to :user
has_one :buyer


## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### アソシエーション

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| buyer_id         | references | null: false, foreign_key: true |

### アソシエーション

belongs_to :buyer