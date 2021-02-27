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

## usersテーブル
| Column   | Type   | Options     |
| ---------|------- |-------------|
| email    | string | null: false |
| password | string | null: false |

### Association
has_one :profile
has_many :items

## profileテーブル
| Column      | Type       | Options                        |
| ------------|----------- |--------------------------------|
| nickname    | string     | null: false                    |
| f_name      | string     | null: false                    |
| l_name      | string     | null: false                    |
| f_name_kana | string     | null: false                    |
| l_name_kana | string     | null: false                    |
| birthday    | date       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
belongs_to :user

## itemsテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :item_profile
has_one :bayer

## item_profileテーブル

| Column          | Type       | Options                        |
| ----------------|----------- |--------------------------------|
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_burden | string     | null: false                    |
| area            | string     | null: false                    |
| delivery_time   | string     | null: false                    |
| time            | references | null: false, foreign_key: true |

### Association
belongs_to :item

## bayerテーブル
| Column   | Type       | Options                        |
| ---------| ---------- |--------------------------------|
| item     | references | null: false, foreign_key: true |
| address  | string     |                                |
| Card     | integer    |                                |

### Association
belongs_to :item

## categoryテーブル

| Column | Type       | Options     |
| ------ | ---------- |-------------|
| name   | string     | null: false |

## conditionテーブル

| Column | Type       | Options     |
| ------ | ---------- |-------------|
| name   | string     | null: false |

## delivery_burdenテーブル

| Column | Type       | Options     |
| ------ | ---------- |-------------|
| name   | string     | null: false |

## areaテーブル

| Column | Type       | Options     |
| ------ | ---------- |-------------|
| name   | string     | null: false |

## delivery_timeテーブル

| Column | Type       | Options     |
| ------ | ---------- |-------------|
| name   | string     | null: false |
