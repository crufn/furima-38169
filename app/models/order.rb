class Order
  include ActiveModel::Model
  attr_accessor :region_id, :city, :address, :building_name, :building_name, :phone_number, :postal_code, :user_id, :item_id

  with_options presence: true do
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(region_id: region_id, city: city, address: address, phone_number: phone_number, postal_code: postal_code, building_name: building_name, purchase_record_id: purchase_record.id)
  end

end
