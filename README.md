# テーブル設計

## users テーブル

| Colum                | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null:false               |
| email                | string | null:false, unique: true |
| encrypted_password   | string | null:false               |
| last_name            | string | null:false               |
| first_name           | string | null:false               |
| last_kana            | string | null:false               |
| first_kana           | string | null:false               |
| birthday             | date   | null:false               |

### Association

- has_many :products
- has_many :purchases




## Products

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null:false                    |
| description        | text       | null:false                    |
| user               | references | null:false, foreign_key: true |
| category_id        | integer     | null:false                    |
| status_id          | integer     | null:false                    |
| delivery_charge_id | integer     | null:false                    |
| prefecture_id      | integer     | null:false                    |
| until_delivery_id  | integer     | null:false                    |
| price              | integer     | null:false                    |

### Association

- belongs_to :user
- has_one   :purchase



## Purchases

| Colum   | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_kye: true |
| product | references | null:false, foreign_kye: true |

### Association

- has_one    :buyer
- belongs_to :product
- belongs_to :user


## Buyers

| Colum           | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| zip_code        | string     | null:false                    |
| prefecture_id   | integer     | null:false                    |
| municipality    | string     | null:false                    |
| address         | string     | null:false                    |
| building        | string     |                               |
| phone_number    | string     | null:false                    |
| purchase        | references | null:false, foreign_key: true |

### Association

- belongs_to :purchase

