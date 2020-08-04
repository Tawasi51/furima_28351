# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | null: false |
| family_name    | string | null: false |
| given_name | string | null: false |
| kana_family_name | string | null: false |
| kana_given_name    | string | null: false |
| birth_year | string | null: false |
| birth_month | string | null: false |
| birth_day | string | null: false |






## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_name   | string | null: false |
| item_text | string | null: false |
| item_price    | integer | null: false |

### Association

- has_one : addresses

## delivers テーブル

| Column | Type  | Options                        |
| ------ | ---------- | ------------------------------ |
| card_number   | integer | null: false |
| exp_month   | integer  | null: false |
| exp＿year | integer | null: false |
| cvc   | integer | null: false |

### Association

- has_one : addresses

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code    | integer | null: false|
| pref    | string | null: false |
| city    | string | null: false|
| street    | string | null: false |
| building   | string | default: "" |
| tel    | integer | null: false |
| deliver    | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :deliver
- belongs_to :item 