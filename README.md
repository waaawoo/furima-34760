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
| Column      | Type       | Options     |
| ------------|----------- |-------------|
| email       | string     | null: false |
| password    | string     | null: false |
| nickname    | string     | null: false |
| f_name      | string     | null: false |
| l_name      | string     | null: false |
| f_name_kana | string     | null: false |
| l_name_kana | string     | null: false |
| birthday    | date       | null: false |


### Association
has_many :items

## itemsテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| delivery_burden    | integer    | null: false                    |
| area               | integer    | null: false                    |
| delivery_time      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :bayer_history

## bayer_historyテーブル
| Column   | Type       | Options                        |
| ---------| ---------- |--------------------------------|
| item_id  | references | null: false, foreign_key: true |
| user_id  | integer    | null: false                    |

### Association
belongs_to :item
has_one :bayer_info
## bayer_infoテーブル
| Column         | Type         | Options                        |
| ---------------| ------------ |--------------------------------|
| item_id        | references   | null: false, foreign_key: true |
| post_num       | integer      | null: false                    |
| area_id        | integer      | null: false                    |
| municipalities | string       | null: false                    |
| address        | string       | null: false                    |
| building_name  | string       |                                |
| phone_num      | integer      | null: false                    |

### Association
belongs_to :bayer_history
