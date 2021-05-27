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

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| title      | string     | nill: false                    | 
| category   | text       | nill: false                    |
| price      | integer    | nill: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases

## purchasesテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| purchase   | text       | nill: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| address         | text       | nill: false                    |
| delivery_charge | integer    | nill: false                    |
| delivery_area   | text       | nill: false                    |
| delivery_days   | text       | nill: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
