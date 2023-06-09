### users

| Column     | Type   | Options     |
|------------|--------|-------------|
| nickname   | string | null: false |
| family_name| string | null: false |
| family_kata| string | null: false |
| first_name | string | null: false |
| first_kata | string | null: false |
| email      | string | null: false, unique: true |
| encrypted_password | string | null: false |
| birthday   | date   | null: false |

### items

| Column          | Type    | Options                       |
|-----------------|---------|-------------------------------|
| item_name       | string  | null: false                   |
| item_explanation| text    | null: false                   |
| price           | integer | null: false                   |
| category_id     | integer | null: false                   |
| condition_id    | integer | null: false                   |
| deliverycharge_id | integer  | null: false                |
| daysdelivery_id | integer | null: false                   |
| region_id       | integer | null: false                   |
| user            | references | null: false, foreign_key: true |

### purchase_records

| Column          | Type    | Options                       |
|-----------------|---------|-------------------------------|
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### shipping_addresses

| Column              | Type    | Options                       |
|---------------------|---------|-------------------------------|
| purchase_record     | references | null: false, foreign_key: true |
| region_id           | integer | null: false                   |
| city                | string  | null: false                   |
| address             | string  | null: false                   |
| building_name       | string  |                               |
| phone_number        | string  | null: false                   |
| postal_code         | string  | null: false                   |

### Associations

- Userモデル
  - has_many :items
  - has_many :purchase_records

- Itemモデル
  - belongs_to :user
  - has_one :purchase_record

- PurchaseRecordモデル
  - belongs_to :user
  - belongs_to :item
  - has_one :shipping_address

- ShippingAddressモデル
  - belongs_to :purchase_record