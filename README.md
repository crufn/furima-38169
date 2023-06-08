### users

| Column     | Type   | Options     |
|------------|--------|-------------|
| user_id    | string | null: false |
| nickname   | string | null: false |
| family_name| string | null: false |
| first_name | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| birthday   | string | null: false |

### items

| Column          | Type    | Options                       |
|-----------------|---------|-------------------------------|
| item_id         | string  | null: false                   |
| item_image      | string  | null: false                   |
| item_name       | string  | null: false                   |
| item_explanation| string  | null: false                   |
| price           | string  | null: false                   |
| categoly        | string  | null: false                   |
| item_condition  | string  | null: false                   |
| delivery_charge | string  | null: false                   |
| days_delivery   | sdring  | null: false                   |
| is_sold         | string  | null: false                   |

### purchase_records

| Column          | Type    | Options                       |
|-----------------|---------|-------------------------------|
| item_id         | integer | null: false, foreign_key: true |
| user_id         | integer | null: false, foreign_key: true |
| purchase_date   | string  | null: false                   |
| purchase_quanity| string  | null: false                   |
| purchase_amount | string  | null: false                   |
| method          | string  | null: false                   |
| shopping_address| string  | null: false                   |
| order_status    | string  | null: false                   |

### shipping_addresses

| Column              | Type    | Options                       |
|---------------------|---------|-------------------------------|
| id                  | string  | null: false                   |
| item_id             | string  | null: false                   |
| user_id             | string  | null: false                   |
| city                | string  | null: false                   |
| address             | string  | null: false                   |
| building_name       | string  | null: false                   |
| phone_number        | string  | null: false                   |
| postal_code         | string  | null: false                   |
| street_address      | string  | null: false                   |

### Associations

- Userモデル
  - has_many :items
  - has_many :purchase_records

- Itemモデル
  - belongs_to :user
  - has_many :purchase_records

- PurchaseRecordモデル
  - belongs_to :user
  - belongs_to :item
  - has_one :shipping_address

- ShippingAddressモデル
  - belongs_to :purchase_record