usersテーブル

｜　Column           |   Type    |     Options              |
｜-------------------|-----------|------------------------- |
|nickname            | string    | null:false               |
|email               | string    | null:false ,unique: true |
|encrypted_password  | string    | null:false                |
|last_name           | string    | null:false               |
|first_name          | string    | null:false               |
|read_last_name      | string    | null:false               |
|read_first_name     | string    | null:false               |
|birth_day           | date      | null:false               |

Association
has_many:items
has_many:purchases


itemsテーブル

｜　Column           |   Type      |     Options                |
｜-------------------|----------- |---------------------------- |
|name                | string     | null:false                  |
|description         | text       | null:false                  |
|category_id         | integer    | null:false                  |
|state_id            | integer    | null:false                  |
|shipping_fee_id     | integer    | null:false                  |
|prefecture_id       | integer    | null:false                  |
|reach_date_id       | integer    | null:false                  |
|price               | integer    | null:false                  |
|user                | references | null:false,foreign_key:true |       

Association
belongs_to :user
has_one :purchase


purchasesテーブル

｜　Column           |   Type      |     Options                  |
｜-------------------|-----------  |----------------------------- |
|user                | references  | null:false,foreign_key:true  |
|item                | references  |  null:false,foreign_key:true |

Association
belongs_to :item
has_one :address
belongs_to :user


addressesテーブル

｜　Column           |   Type        |     Options                 |
｜-------------------|-------------- |--------------------------   |
|postal_code         | string        | null:false                  | 
|prefecture_id       | integer       | null:false                  |
|city                | string        | null:false                  |
|house_number        | string        | null:false                  |
|building_name       | string        | 　　　　　　                  |
|phone_number        | string        | null:false                  |
|purchase            | references    | null:false,foreign_key:true |

Association
belongs_to :purchase