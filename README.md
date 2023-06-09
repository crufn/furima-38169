### users

| Column     | Type   | Options     |
|------------|--------|-------------|
| user_id    | string |             |
| nickname   | string | null: false |
| family_name| string | null: false |
| family_kata| string | null: false |
| first_name | string | null: false |
| first_kata | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| birthday   | date   | null: false |

### items

| Column          | Type    | Options                       |
|-----------------|---------|-------------------------------|
| item_id         | string  |                               |
| item_name       | string  | null: false                   |
| item_explanation| string  | null: false                   |
| price           | string  | null: false                   |
| categoly        | string  | null: false                   |
| condition_id    | string  | null: false                   |
| deliverycharge_id | string  | null: false                   |
| daysdelivery_id | sdring  | null: false                   |
| region_id       | string  | null: false                   |

### purchase_records

| Column          | Type    | Options                       |
|-----------------|---------|-------------------------------|
| item_id         | integer | null: false, foreign_key: true |
| user_id         | integer | null: false, foreign_key: true |

### shipping_addresses

| Column              | Type    | Options                       |
|---------------------|---------|-------------------------------|
| city                | string  | null: false                   |
| address             | string  | null: false                   |
| building_name       | string  |                               |
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
  - has_one :shipping_address, foreign_key: :purchase_record_id

- ShippingAddressモデル
  - belongs_to :purchase_record, foreign_key: :purchase_record_id