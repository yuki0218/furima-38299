# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| send_days_id       | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :purchase_record

## shopping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_records

## purchase_records テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true | 
| item             | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopping_address