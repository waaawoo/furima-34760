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
| Column             | Type       | Options                   |
| -------------------|----------- |---------------------------|
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| nickname           | string     | null: false               |
| f_name             | string     | null: false               |
| l_name             | string     | null: false               |
| f_name_kana        | string     | null: false               |
| l_name_kana        | string     | null: false               |
| birthday           | date       | null: false               |


### Association
has_many :items
has_many :buyer_historys
## itemsテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| price              | integer    | null: false
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buyer_history

## buyer_historyテーブル
| Column  | Type       | Options                        |
| --------| ---------- |--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :buyer_info
## buyer_infoテーブル
| Column         | Type         | Options                        |
| ---------------| ------------ |--------------------------------|
| buyer_history  | references   | null: false, foreign_key: true |
| post_num       | string       | null: false                    |
| area_id        | integer      | null: false                    |
| municipalities | string       | null: false                    |
| address        | string       | null: false                    |
| building_name  | string       |                                |
| phone_num      | string       | null: false                    |

### Association
belongs_to :buyer_history
