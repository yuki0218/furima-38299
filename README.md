# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_one :purchase_record

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| send_area       | string     | null: false                    |
| send_days       | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_record テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| post_code    | string    | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| address      | string    | null: false                    |
| building     | string    |                                |
| phone_number | string    | null: false                    |
| user_id      |references | null: false, foreign_key: true | 
| item_id      |references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
