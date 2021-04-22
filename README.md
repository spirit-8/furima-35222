# テーブル設計

## users テーブル

| Colum      | Type   | Options |
| ---------- | ------ ||
| nickname   | string | null:false |
| email      | string | null:false |
| password   | string | null:false |
| last_name  | string | null:false |
| first_name | string | null:false |
| last_kana  | string | null:false |
| first_kana | string | null:false |
| birthday   | date   | null:false |



## Products

| Colum           | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null:false                    |
| description     | text       | null:false                    |
| user            | references | null:false, foreign_key: true |
| category        | string     | null:false                    |
| status          | string     | null:false                    |
| delivery_charge | string     | null:false                    |
| delivery_source | string     | null:false                    |
| until_delivery  | date       | null:false                    |
| price           | integer    | null:false                    |




## Purchases

| Colum        | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| zip_code     | integer    | null:false                    |
| prefecture   | string     | null:false                    |
| municipality | string     | null:false                    |
| address      | string     | null:false                    |
| building     | string     |                               |
| phone_number | integer    | null:false                    |
| user         | references | null:false, foreign_key: true |