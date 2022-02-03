# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| description        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| postage_id         | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| days_post_id       | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## shippings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| address_city       | string     | null: false                    |
| address_block      | string     | null: false                    |
| address_building   | string     | null: true                     |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping
