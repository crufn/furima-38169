class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_explanation, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :deliverycharge_id, null: false
      t.integer :daysdelivery_id, null: false
      t.integer :region_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
