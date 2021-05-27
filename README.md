# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------| 
| nickname           | string | nill: false               |
| email              | string | nill: false, unique: true |
| encrypted_password | string | nill: false               |
| first_name         | string | nill: false               |
| first_name_kana    | string | nill: false               |
| last_name          | string | nill: false               |
| last_name_kana     | string | nill: false               |
| birthday           | date   | nill: false               | 

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| title              | string     | nill: false                    |
| description        | text       | nill: false                    | 
| category_id        | integer    | nill: false                    |
| price              | integer    | nill: false                    |
| condition_id       | integer    | nill: false                    |
| delivery_charge_id | integer    | nill: false                    |
| delivery_area_id   | integer    | nill: false                    |
| delivery_day_id    | integer    | nill: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| user       | references | null: false, foreign_key: true |
| item       | references | nill: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | string     | nill: false                    |
| delivery_area_id | integer    | nill: false                    |
| municipalities   | string     | nill: false                    |
| address_number   | string     | nill: false                    |
| building_name    | string     |                                |
| phone_number     | string     | nill: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
