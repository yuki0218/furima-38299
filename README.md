# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchase_records
- has_one :shopping_address

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| send_area_id       | integer    | null: false                    |
| send_days_id       | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :purchase_record

## shopping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## purchase_records テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| user_id      |references | null: false, foreign_key: true | 
| item_id      |references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item