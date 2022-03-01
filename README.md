# テーブル設計


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- | ----------- |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false |             |
| nickname           | string | null: false |             |
| last_name          | string | null: false |             | 
| first_name         | string | null: false |             |
| last_name_kana     | string | null: false |             |
| first_name_kana    | string | null: false |             |
| birth_day          | date   | null: false |             |


### Association
- has_many :items   
- has_many :purchase_records
- has_one :orders

## items テーブル

| Column        |Type        | Options                        |
| ------------- |----------  | ----------- | ---------------- |
| name          | string     | null: false                    |
| introduction  | text       | null: false                    |
| condition     | string     | null: false                    |
| category      | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| postage       | string     | null: false                    |
| shipping_area | string     | null: false                    |
| days_to_ship  | string     | null: false                    | 
| commission    | string     | null: false                    |
| profit        | string     | null: false                    |


### Association
- belongs_to :user
- has_many :images
- has_one :purchase_records

## images テーブル

| Column        |Type        | Options                        |
| ------------- |----------  | ----------- | ---------------- |
| item          | references | null: false, foreign_key: true |   


### Association
- bolongs_to :item

## purchase_records テーブル

| Column        |Type        | Options                        |
| ------------- |----------  | ----------- | ---------------- |
| item          | references | null: false, foreign_key: true |   
| user          | references | null: false, foreign_key: true |  


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column           |Type        | Options                        |
| ---------------  |----------  | ----------- | ---------------- |
| post_cord        | string     | null: false                    | 
| prefecture       | string     | null: false                    | 
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | string     | null: false                    |
| purchase_records | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase_record

## orders テーブル

| Column           |Type        | Options                        |
| ---------------  |----------  | ----------- | ---------------- |
| price            | integer    | null; false |                  |

### Association
- belongs_to :user
