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
| birth_day | date | null: false |

### Association

- has_one : sales

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text | text | null: false |
| price    | integer | null: false |

### Association

- has_one : sales

## sales テーブル

| Column | Type  | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true　 |
| item_id   | integer  | null: false, foreign_key: true |
| address_id   | integer  | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to : items
- has_one : addresses

### addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code    | string | null: false|
| pref    | string | null: false |
| city    | string | null: false|
| street    | string | null: false |
| building   | string | default: "" |
| tel    | string | null: false |
| sale     | references | null: false, foreign_key: true |

### Association

- belongs_to : sales 