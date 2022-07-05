## usersテーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false, unique: true|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|family_name       |string|null: false              |
|first_name        |string|null: false              |
|family_name_kana  |string|null: false              |
|first_name_kana   |string|null: false              |
|birthday          |date  |null: false              |

### Association

has_many :items
has_many :orders


## itemsテーブル
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|name           |string    |null: false                   |
|explain        |text      |null: false                   |
|category_id    |integer   |null: false                   |
|condition_id   |integer   |null: false                   |
|charge_id      |integer   |null: false                   |
|prefecture_id  |integer   |null: false                   |
|schedule_day_id|integer   |null: false                   |
|price          |integer   |null: false                   |
|user           |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :order

## buyersテーブル

|Column       |Type      |Options                           |
|-------------|----------|----------------------------------|
|post_code    |string    |null: false                       |
|prefecture_id|integer   |null: false                       |
|city         |string    |null: false                       |
|address      |string    |null: false                       | 
|building     |string    |                                  |
|telephone    |string    |null: false                       |
|order        |references|null: false, foreign_key: true    |

### Association
belongs_to :order

## ordersテーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :buyer

