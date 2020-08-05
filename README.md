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

- has_many : sales
- has_many : items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text | text | null: false |
| category   | integer | null: false |
| product_state | integer | null: false |
| delivery   | integer | null: false |
| prefecture | integer | null: false |
| days    | integer | null: false |
| price    | integer | null: false |
| due    | integer | null: false |
| revenue   | integer | null: false |
| user_id  | integer | null: false, foreign_key: true　 |


### Association
- belongs_to :user
- has_one : sale
- has_one : address

## sales テーブル

| Column | Type  | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true　 |
| item_id   | integer  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to : item

### addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code    | integer | null: false|
| pref    | string | null: false |
| city    | string | null: false|
| item_id   | integer  | null: false, foreign_key: true |


### Association

- belongs_to : item