# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### アソシエーション

has_many :items
has_many :purchases


## items テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| product_name                 | string     | null: false                    |
| product_description          | text       | null: false                    |
| category_id                  | integer    | null: false                    |
| product_condition_id         | integer    | null: false                    |
| burden_of_shipping_charge_id | integer    | null: false                    |
| shipping_area_id             | integer    | null: false                    |
| days_to_ship_id              | integer    | null: false                    |
| price                        | integer    | null: false                    |
| user                         | references | null: false, foreign_key: true |
### アソシエーション

belongs_to :user
has_one :purchase


## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### アソシエーション

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| shipping_area    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### アソシエーション

belongs_to :purchase