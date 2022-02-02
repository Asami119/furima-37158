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
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| description        | text        | null: false                    |
| category           | string      | null: false                    |
| condition          | string      | null: false                    |
| postage            | string      | null: false                    |
| prefecture         | string      | null: false                    |
| days_post          | string      | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| postcode           | string     | null: false                    |
| address_prefecture | string     | null: false                    |
| address_city       | string     | null: false                    |
| address_block      | string     | null: false                    |
| address_building   | string     | null: true                     |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item