# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
|------------|--------|-------------|
| nickname   | string | nill: false |
| email      | string | nill: false |
| password   | string | nill: false |
| name       | string | nill: false |
| birthday   | date   | nill: false |

### Association

- has_many :items
- has_many :purchases
- has_one :addresses

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
- has_one :addresses

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

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| address    | text       | nill: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| purchase   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase
