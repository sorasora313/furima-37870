## usersテーブル

|Column　　　　　　|Type  |Options                  |
|nickname        |string|null: false, unique: true|
|email           |string|null: false, unique: true|
|password        |string|null: false, unique: true|
|family_name     |string|null: false, unique: true|
|first_name      |string|null: false, unique: true|
|family_name_kana|string|null: false, unique: true|
|first_name_kana |string|null: false, unique: true|
|birthday        |date  |null: false, unique: true|

### Association

has_many :items
has_many :orders


## itemsテーブル

|Column    |Type     |Options                        |
|image     |string    |null: false                   |
|name      |string    |null: false                   |
|explain   |text      |null: false                   |
|category  |integer   |null: false                   |
|condition |integer   |null: false                   |
|charge    |integer   |null: false                   |
|local_area|integer   |null: false                   |
|days      |integer   |null: false                   |
|price     |integer   |null: false                   |
|user      |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :order

## buyersテーブル

|Column    |Type      |Options                           |
|post_code |string    |null: false                       |
|prefecture|integer   |null: false                       |
|city      |string    |null: false                       |
|address   |string    |null: false                       | 
|building  |string    |                                  |
|telephone |string    |null: false                       |
|orders    |references|null: false, foreign_key: true    |

### Association
belongs_to :order

## ordersテーブル

|Column |Type      |Options                       |
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :buyer

