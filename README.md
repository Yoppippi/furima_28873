# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |
| email            | string | null: false |
| password         | string | null: false |

### Association

- has_many :items
- has_many :transactions


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| image               | text       | null: false                    |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | int        | null: false                    |
| status_id           | int        | null: false                    |
| delivery_fee_id     | int        | null: false                    |
| shipping_address_id | int        | null: false                    |
| until_shipping_id   | int        | null: false                    |
| price               | int        | null: false                    |

### Associatioé

- belongs_to :user
- has_one :transaction

## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| transaction      | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| prefectures_id   | int        | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :transaction

## transactions テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :purchase
- belongs_to :user




