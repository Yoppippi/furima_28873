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

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | int        | null: false, foreign_key: true |
| image             | text       | null: false                    |
| item_name         | string     | null: false                    |
| description       | text       | null: false                    |
| category          | string     | null: false                    |
| status            | string     | null: false                    |
| delivery_fee      | int        | null: false                    |
| shipping_address  | string     | null: false                    |
| until_shipping    | int        | null: false                    |
| price             | int        | null: false                    |

## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| creditcard       | int        | null: false                    |
| shipping_address | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| phone_number     | int        | null: false                    |
a